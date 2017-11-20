using Google.Cloud.Storage.V1;
using System;
using System.Threading.Tasks;
using System.Web;

namespace DesiCooks.Data_Layer
{
    public class ImageUploader
    {
        private readonly string _bucketName;
        private readonly StorageClient _storageClient;

        public ImageUploader(string bucketName)
        {
            _bucketName = bucketName;
            // [START storageclient]
            _storageClient = StorageClient.Create();
            // [END storageclient]
        }

        // [START uploadimage]
        public string UploadImage(HttpPostedFile image, string name)
        {
            var imageAcl = PredefinedObjectAcl.PublicRead;

            var imageObject = _storageClient.UploadObject(
                bucket: _bucketName,
                objectName: name,
                contentType: image.ContentType,
                source: image.InputStream,
                options: new UploadObjectOptions { PredefinedAcl = imageAcl }
            );

            return imageObject.MediaLink;
        }
        // [END uploadimage]

        public async Task DeleteUploadedImage(long id)
        {
            try
            {
                await _storageClient.DeleteObjectAsync(_bucketName, id.ToString());
            }
            catch (Google.GoogleApiException exception)
            {
                // A 404 error is ok.  The image is not stored in cloud storage.
                if (exception.Error.Code != 404)
                    throw;
            }
        }
    }
}