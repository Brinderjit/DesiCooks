using DesiCooks.Data_Layer;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DesiCooks
{
    public partial class addImage : System.Web.UI.Page
    {
        private static DataAccess _dataObject = new DataAccess();
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
        protected void insertNewFood_Click(object sender, EventArgs e)
        {
            try
            {
                var image = imageUpload.PostedFile;
                var ThumbnailuploadFilesDir = System.Web.HttpContext.Current.Server.MapPath("~/Content/images");
                string databasePath = "/Content/images/" + image.FileName;
                string fullThumbnailUrl = ThumbnailuploadFilesDir + "\\" + image.FileName;
                _dataObject.insertFood(txtFoodTitle.Text, databasePath, txtFoodDescription.Text);
                image.SaveAs(fullThumbnailUrl);
                HiddenField1.Value = "2";
            }
            catch(Exception ex)
            {

            }
        }
    }
}