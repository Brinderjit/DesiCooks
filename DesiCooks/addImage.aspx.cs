using DesiCooks.Data_Layer;
using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Threading.Tasks;
using System.Web;
using DesiCooks.Models;

namespace DesiCooks
{
    public partial class addImage : System.Web.UI.Page
    {
        private static DataAccess _dataObject = new DataAccess();
        private readonly ImageUploader _uploadImage;
        private readonly DatastoreImage _datastore;
        public addImage()
        {
            _uploadImage = new ImageUploader("desicooks_bucket");
            _datastore = new DatastoreImage("desicooks-180117");      
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public Bitmap CreateThumbnail(string lcFilename, int lnWidth, int lnHeight)
        {
            System.Drawing.Bitmap bmpOut = null;
            try
            {
                Bitmap loBMP = new Bitmap(lcFilename);
                ImageFormat loFormat = loBMP.RawFormat;

                decimal lnRatio;
                int lnNewWidth = lnWidth;
                int lnNewHeight = lnHeight;

                //*** If the image is smaller than a thumbnail just return it
                /*   if (loBMP.Width < lnWidth && loBMP.Height < lnHeight)D:\GitRepos\TrendingPunjab\TrendingPunjab\DataLayer\DataLogic.cs
                       return loBMP;

                   if (loBMP.Width > loBMP.Height)
                   {
                       lnRatio = (decimal)lnWidth / loBMP.Width;
                       lnNewWidth = lnWidth;
                       decimal lnTemp = loBMP.Height * lnRatio;
                       lnNewHeight = (int)lnTemp;
                   }
                   else
                   {
                       lnRatio = (decimal)lnHeight / loBMP.Height;
                       lnNewHeight = lnHeight;
                       decimal lnTemp = loBMP.Width * lnRatio;
                       lnNewWidth = (int)lnTemp;
                   }*/
                bmpOut = new Bitmap(lnNewWidth, lnNewHeight);
                Graphics g = Graphics.FromImage(bmpOut);
                g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                g.FillRectangle(Brushes.White, 0, 0, lnNewWidth, lnNewHeight);
                g.DrawImage(loBMP, 0, 0, lnNewWidth, lnNewHeight);

                loBMP.Dispose();
            }
            catch (Exception e)
            {

            }

            return bmpOut;
        }
        protected  void insertNewFood_Click(object sender, EventArgs e)
        {

            ImageMetaDeta imageObj = new ImageMetaDeta();
            imageObj.title = txtFoodTitle.Text;
            imageObj.url = "";
            imageObj.description = txtFoodDescription.Text;
            try
            {
                HttpPostedFile image = imageUpload.PostedFile;
                //    var imageUrl = Create(image,txtFoodTitle.Text,txtFoodDescription.Text);
                //  imageObj.url = imageUrl.Result;
                string imageUrl= _uploadImage.UploadImage(image, imageObj.title);
                imageObj.url = "https://storage.googleapis.com/desicooks_bucket/"+imageObj.title;
                _datastore.Create(imageObj);
               _dataObject.insertFood(txtFoodTitle.Text, imageObj.url, txtFoodDescription.Text);
                HiddenField1.Value = "2";
            }
            catch(Exception ex)
            {
                ExceptionLogging.SendExcepToDB(ex);
            }
        }
       /* public async Task<string> Create(HttpPostedFile image,string title ,string description)
        {
            string imageUrl="";
            try
            {     
               imageUrl = await 
               
            }
            catch(Exception ex)
            {
                ExceptionLogging.SendExcepToDB(ex);
            }
            return imageUrl;
        }*/
    }
}