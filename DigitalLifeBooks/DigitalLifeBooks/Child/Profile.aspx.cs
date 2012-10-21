using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.Models;

namespace DigitalLifeBooks.ChildProfile
{
    public partial class Profile : BaseDLBPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string profileId = Request.QueryString["Id"];

                if (!string.IsNullOrEmpty(profileId))
                {
                    long id = Convert.ToInt64(profileId);

                    var child = DataContext.Children.FirstOrDefault<Child>(x => x.Id == id);

                    if (child != null)
                    {
                        hdnId.Value = child.Id.ToString();

                        

                        //load child details
                        FullName.Text = child.FirstName;
                        BirthDate.Text = child.DateOfBirth.ToShortDateString();
                        BirthCity.Text = child.City;
                        BirthState.Text = child.State;
                        BirthCountry.Text = child.Country;
                        BirthWeight.Text = child.BirthWeight;
                        BirthLength.Text = child.BirthLength;
                        //TODO: get birth mother

                        if (child.Hospital != null)
                        {
                            HospitalName.Text = child.Hospital.Name;
                            HospitalAddress.Text = child.Hospital.Address;
                            HospitalCity.Text = child.Hospital.City;
                            HospitalState.Text = child.Hospital.State;
                            HospitalPhone.Text = child.Hospital.Phone;
                        }

                        if (child.FosterFamily != null)
                        {
                            FatherName.Text = child.FosterFamily.FatherName;
                            MotherName.Text = child.FosterFamily.MotherName;
                            FosterAddress.Text = child.FosterFamily.Address;
                            FosterCity.Text = child.FosterFamily.City;
                            FosterState.Text = child.FosterFamily.State;
                            FosterCountry.Text = child.FosterFamily.Country;
                            FosterPhone.Text = child.FosterFamily.Phone;
                        }

                        if (child.School != null)
                        {
                            SchoolName.Text = child.School.Name;
                            SchoolAddress.Text = child.School.Address;
                            SchoolCity.Text = child.School.City;
                            SchoolState.Text = child.School.State;
                            SchoolCountry.Text = child.School.Country;
                            SchoolPhone.Text = child.School.Phone;
                        }
                    }
                }



            }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (Page.IsValid)
            {
                long id = Convert.ToInt64(hdnId.Value);
                Child child = DataContext.Children.First(x => x.Id == id);

                if (child != null)
                {
                    if (child.FosterFamily == null)
                        child.FosterFamily = new FosterFamily();

                    child.FosterFamily.FatherName = FatherName.Text;
                    child.FosterFamily.MotherName = MotherName.Text;
                    child.FosterFamily.Address = FosterAddress.Text;
                    child.FosterFamily.City = "cbus";
                    child.FosterFamily.State = FosterState.Text;
                    child.FosterFamily.Country = FosterCountry.Text;
                    child.FosterFamily.Phone = FosterPhone.Text;
                    child.FosterFamily.FosterSibling = FosterSibling.Text;

                    if (child.Hospital == null)
                        child.Hospital = new Hospital();

                    child.Hospital.Name = HospitalName.Text;
                    child.Hospital.Address = HospitalAddress.Text;
                    child.Hospital.City = HospitalCity.Text;
                    child.Hospital.State = HospitalState.Text;
                    child.Hospital.Phone = HospitalPhone.Text;

                    if (child.School == null)
                        child.School = new School();

                    child.School.Name = SchoolName.Text;
                    child.School.Address = SchoolAddress.Text;
                    child.School.City = SchoolCity.Text;
                    child.School.State = SchoolState.Text;
                    child.School.Country = SchoolCountry.Text;
                    child.School.Phone = SchoolPhone.Text;

                    string[] name = FullName.Text.Split(new string[]{" "}, StringSplitOptions.RemoveEmptyEntries);

                    child.FirstName = name[0];
                    child.LastName = name.Length > 1 ? name[1] : string.Empty;
                    child.City = BirthCity.Text;
                    child.State = BirthState.Text;
                    child.DateOfBirth = Convert.ToDateTime(BirthDate.Text);
                    child.Country = BirthCountry.Text;
                    child.BirthWeight = BirthWeight.Text;
                    child.BirthLength = BirthLength.Text;
                    //todo: sibling

                    DataContext.SaveChanges();
                }
            }
        }
    }
}