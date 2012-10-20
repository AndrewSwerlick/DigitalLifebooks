<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="DigitalLifeBooks._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script src="../Scripts/jquery/jquery.cycle.all.js?cdv=69" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    <div id="dnn_BannerPane" class="BannerPane">
		    <div class="DnnModule DnnModule-DNN_HTML DnnModule-439"><a name="439"></a>
				<div class="RotatorLeft" id="rotLeft439"></div>
					<div id="dnn_ctr439_ContentPane"><!-- Start_Module_439 -->
                        <div id="dnn_ctr439_ModuleContent" class="DNNModuleContent ModDNNHTMLC">
						    <div id="dnn_ctr439_HtmlModule_lblContent" class="Normal">
                                <img src="../Styles/Images/Slider/scroller1.png" />
						    <img alt="" src="../Styles/Images/Slider/scroller1.png" style="width: 753px; height: 288px;" />
						    <img alt="" src="../Styles/Images/Slider/scroller2.png" style="width: 753px; height: 288px;" />
						    <img alt="" src="../Styles/Images/Slider/scroller3.png" style="width: 753px; height: 288px;" />
						    <img alt="" src="../Styles/Images/Slider/scroller4.png" style="width: 753px; height: 288px;" />
					        </div>
				        </div><!-- End_Module_439 -->
			        </div>
			    <div class="RotatorRight" id="rotRight439"></div>
			    <script type="text/javascript">
			        jQuery(document).ready(function ($) {
			            /*  Banner Rotator Script
			            This script will automatically create a banner rotator based on the content entered into container.
			            The script will automatically cycle through all the sibling elements and create a full rotator including navigation.
			            Banner sizes and other styles are located in container.css.  The page titles for the navigation row are
			            created from each display elements title attribute.
			            See http://jquery.malsup.com/cycle/ for more info on plugin.
			            */
			            $('#rotLeft439 + div div[id$="lblContent"]').cycle({
			                fx: 'fade', //effect to apply to rotation
			                speed: 1000, // speed of the transition (any valid fx speed value) 
			                timeout: 5000, // milliseconds between slide transitions (0 to disable auto advance),
			                prev: '#rotLeft439',
			                next: '#rotRight439'
			            });
			        });
			    </script>
            </div>
        </div>

    
</asp:Content>
