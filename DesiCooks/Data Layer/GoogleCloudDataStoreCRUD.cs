using Google.Cloud.Datastore.V1;
using Google.Protobuf;
using System;
using System.Linq;
using DesiCooks.Models;
namespace DesiCooks.Data_Layer
{
  
        public static class DatastoreImageeExtensionMethods
        {
            /// <summary>
            /// Make a datastore key given a book's id.
            /// </summary>
            /// <param name="id">A book's id.</param>
            /// <returns>A datastore key.</returns>
            public static Key ToKey(this long id) =>
                new Key().WithElement("Image", id);

            /// <summary>
            /// Make a book id given a datastore key.
            /// </summary>
            /// <param name="key">A datastore key</param>
            /// <returns>A book id.</returns>
            public static long ToId(this Key key) => key.Path.First().Id;

            /// <summary>
            /// Create a datastore entity with the same values as book.
            /// </summary>
            /// <param name="book">The book to store in datastore.</param>
            /// <returns>A datastore entity.</returns>
            /// [START toentity]
            public static Entity ToEntity(this ImageMetaDeta image) => new Entity()
            {
                Key = image.imageId.ToKey(),
                ["Title"] = image.title,
                ["Url"] = image.url,
                ["Description"] = image.description
            };
            // [END toentity]

            /// <summary>
            /// Unpack a book from a datastore entity.
            /// </summary>
            /// <param name="entity">An entity retrieved from datastore.</param>
            /// <returns>A book.</returns>
            public static ImageMetaDeta ToImageMetaData(this Entity entity) => new ImageMetaDeta()
            {
                imageId= entity.Key.Path.First().Id,
                title = (string)entity["Title"],
                url = (string)entity["Url"],
                description = (string)entity["Description"],
             
            };
        }

        public class DatastoreImage 
        {
            private readonly string _projectId;
            private readonly DatastoreDb _db;

            /// <summary>
            /// Create a new datastore-backed bookstore.
            /// </summary>
            /// <param name="projectId">Your Google Cloud project id</param>
            public DatastoreImage(string projectId)
            {
                _projectId = projectId;
                _db = DatastoreDb.Create(_projectId);
            }

            // [START create]
            public void Create(ImageMetaDeta image)
            {try
            {



                var entity = image.ToEntity();
                entity.Key = _db.CreateKeyFactory("Image").CreateIncompleteKey();
                var keys = _db.Insert(entity);
                image.imageId = keys.Path.First().Id;
            }
            catch(Exception e)
            {
                ExceptionLogging.SendExcepToDB(e);
            }
            }
            // [END create]

            public void Delete(long id)
            {
                _db.Delete(id.ToKey());
            }

            // [START list]
           
            // [END list]

            public ImageMetaDeta Read(long id)
            {
                return _db.Lookup(id.ToKey())?.ToImageMetaData();
            }

            public void Update(ImageMetaDeta image)
            {
                _db.Update(image.ToEntity());
            }
        }

    
}