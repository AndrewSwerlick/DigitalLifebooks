using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.Models;
using System.Web.Security;

namespace DigitalLifeBooks.ChildProfile
{
    public partial class Profile : BaseDLBPage
    {
        public Child Child { get; set; }
        public string ProfilePicPath { get; set; }
        public string AlbumId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string profileId = Request.QueryString["Id"];

                if (!string.IsNullOrEmpty(profileId))
                {
                    long id = Convert.ToInt64(profileId);

                    Child = DataContext.Children.FirstOrDefault<Child>(x => x.Id == id);
                    if (Child == null)
                        Response.Redirect("/Child/ChildNotFound.aspx");
                    if (Child != null)
                    {
                        if (!Child.UserIsAuthorizedForChild(CurrentUser))
                            Response.Redirect("/UnAuthorized.aspx");

                        hdnId.Value = Child.Id.ToString();

                        ProfilePicPath = Child.ProfilePickLink;

                        AlbumId = Child.ProfileAlbumId.ToString();

                        //load child details
                        FullName.Text = Child.FirstName;
                        BirthDate.Text = Child.DateOfBirth.ToShortDateString();
                        BirthCity.Text = Child.City;
                        BirthState.Text = Child.State;
                        BirthCountry.Text = Child.Country;
                        BirthWeight.Text = Child.BirthWeight;
                        BirthLength.Text = Child.BirthLength;
                        BirthMother.Text = Child.BirthSiblingRelationship;
                        BirthSibling.Text = Child.BirthSibling;
                        cboRelationship.SelectedValue = Child.BirthSiblingRelationship;
                        CaseWorker.Text = Child.CaseWorker;
                        //TODO: get birth mother

                        if (Child.Hospital != null)
                        {
                            HospitalName.Text = Child.Hospital.Name;
                            HospitalAddress.Text = Child.Hospital.Address;
                            HospitalCity.Text = Child.Hospital.City;
                            HospitalState.Text = Child.Hospital.State;
                            HospitalPhone.Text = Child.Hospital.Phone;
                        }

                        if (Child.FosterFamily != null)
                        {
                            FatherName.Text = Child.FosterFamily.FatherName;
                            MotherName.Text = Child.FosterFamily.MotherName;
                            FosterAddress.Text = Child.FosterFamily.Address;
                            FosterCity.Text = Child.FosterFamily.City;
                            FosterState.Text = Child.FosterFamily.State;
                            FosterCountry.Text = Child.FosterFamily.Country;
                            FosterPhone.Text = Child.FosterFamily.Phone;
                            FosterSibling.Text = Child.FosterFamily.FosterSibling;
                            cboFosterSibling.SelectedValue = Child.FosterFamily.FosterSiblingRelationship;
                        }

                        if (Child.School != null)
                        {
                            SchoolName.Text = Child.School.Name;
                            SchoolAddress.Text = Child.School.Address;
                            SchoolCity.Text = Child.School.City;
                            SchoolState.Text = Child.School.State;
                            SchoolCountry.Text = Child.School.Country;
                            SchoolPhone.Text = Child.School.Phone;
                        }
                    }
                }
                else
                {
                    Response.Redirect("/Child/ChildNotFound.aspx");
                }

            }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (Page.IsValid)
            {
                long id = Convert.ToInt64(hdnId.Value);
                Child = DataContext.Children.First(x => x.Id == id);

                if (Child != null)
                {
                    if (Child.FosterFamily == null)
                        Child.FosterFamily = new FosterFamily();

                    Child.FosterFamily.FatherName = FatherName.Text;
                    Child.FosterFamily.MotherName = MotherName.Text;
                    Child.FosterFamily.Address = FosterAddress.Text;
                    Child.FosterFamily.City = "cbus";
                    Child.FosterFamily.State = FosterState.Text;
                    Child.FosterFamily.Country = FosterCountry.Text;
                    Child.FosterFamily.Phone = FosterPhone.Text;
                    Child.FosterFamily.FosterSibling = FosterSibling.Text;
                    Child.FosterFamily.FosterSiblingRelationship = cboFosterSibling.SelectedValue;

                    if (Child.Hospital == null)
                        Child.Hospital = new Hospital();

                    Child.Hospital.Name = HospitalName.Text;
                    Child.Hospital.Address = HospitalAddress.Text;
                    Child.Hospital.City = HospitalCity.Text;
                    Child.Hospital.State = HospitalState.Text;
                    Child.Hospital.Phone = HospitalPhone.Text;

                    if (Child.School == null)
                        Child.School = new School();

                    Child.School.Name = SchoolName.Text;
                    Child.School.Address = SchoolAddress.Text;
                    Child.School.City = SchoolCity.Text;
                    Child.School.State = SchoolState.Text;
                    Child.School.Country = SchoolCountry.Text;
                    Child.School.Phone = SchoolPhone.Text;

                    string[] name = FullName.Text.Split(new string[]{" "}, StringSplitOptions.RemoveEmptyEntries);

                    Child.FirstName = name[0];
                    Child.LastName = name.Length > 1 ? name[1] : string.Empty;
                    Child.City = BirthCity.Text;
                    Child.State = BirthState.Text;
                    Child.DateOfBirth = Convert.ToDateTime(BirthDate.Text);
                    Child.Country = BirthCountry.Text;
                    Child.BirthWeight = BirthWeight.Text;
                    Child.BirthLength = BirthLength.Text;
                    Child.BirthSibling = BirthSibling.Text;
                    Child.BirthSiblingRelationship = cboRelationship.SelectedValue;
                    Child.CaseWorker = CaseWorker.Text;

                    try
                    {
                        DataContext.SaveChanges();

                        Response.Redirect(string.Format("/ChildProfile/Dashboard.aspx?ChildId={0}", Child.Id));
                    }
                    catch (Exception ex)
                    {
                        //TODO: log error

                        lblStatus.Text = "Unable to save the profile data.";
                    }
                }
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            long id = Convert.ToInt64(hdnId.Value);
            Response.Redirect(string.Format("/ChildProfile/Dashboard.aspx?ChildId={0}", id));
        }
    }
}