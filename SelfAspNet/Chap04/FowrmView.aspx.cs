using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap04
{
    public partial class FowrmView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void fv_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            //fv.DefaultMode = FormViewMode.Insert;
        }

        protected void fv_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            var txtPrice = (TextBox)fv.FindControl("priceTextBox");
            if (Int32.Parse(txtPrice.Text) <= 0)
            //if (Int32.Parse(e.NewValues["price"].ToString()) <= 0)
            {
                e.NewValues["price"] = e.OldValues["price"];
            }
        }
    }
}