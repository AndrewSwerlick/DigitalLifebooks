<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="DigitalLifeBooks._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script src="../Scripts/jquery/jquery.cycle.all.js?cdv=69" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    <div id="dnn_BannerPane" class="BannerPane" style="margin-bottom:48px;">
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

        <div class="clearfix">
                <div class="bottomLeftPane">
					<div>
					<a name="436"></a>
						<div class="c_home c_right">
							<h2 class="Title"><span class="Head">OUR MISSION</span></h2>
							<div>
								<div class="DNNModuleContent ModDNNHTMLC">
									<div  class="Normal">
										<div style="text-align: right;">Preserving a child&rsquo;s stories...<br />
										</div>
										<div style="text-align: right;">for an eternity.<br />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
                <div id="dnn_bottomRightPane" class="bottomRightPane">
					<div class="DnnModule DnnModule-DNN_HTML DnnModule-438">
						<a name="438"></a>
						<div class="c_home c_left">
							<h2 class="Title"><span id="dnn_ctr438_dnnTITLE_titleLabel" class="Head">Why Lifebooks</span></h2>
							<div id="dnn_ctr438_ContentPane">
								<!-- Start_Module_438 -->
								<div id="dnn_ctr438_ModuleContent" class="DNNModuleContent ModDNNHTMLC">
									<div id="dnn_ctr438_HtmlModule_lblContent" class="Normal">
										Children in-and-out of home care move an average of 7 times.&nbsp; With each move comes a greater likelihood that a child&rsquo;s belongings will be lost, left behind, or ruined.&nbsp; We don&rsquo;t let that happen.
									</div>
								</div><!-- End_Module_438 -->
							</div>
						</div>
					</div>
				</div>
				
                <div id="dnn_bottomCenterPane" class="bottomCenterPane">
					<div class="DnnModule DnnModule-DNN_HTML DnnModule-437">
						<a name="437"></a>
						<div class="c_home c_center">
							<h2 class="Title"><span id="dnn_ctr437_dnnTITLE_titleLabel" class="Head">About Lifebooks</span></h2>
							<div id="dnn_ctr437_ContentPane">
								<!-- Start_Module_437 -->
								<div id="dnn_ctr437_ModuleContent" class="DNNModuleContent ModDNNHTMLC">
									<div id="dnn_ctr437_HtmlModule_lblContent" class="Normal">
										<p><em>Lifebooks</em> are the documents, stories, and pictures of foster and adoptive children.&nbsp; <strong>Digital LifeBooks</strong> provides secure virtual storage and retrieval of lifebooks to help nurture the well-being of these at-risk individuals.</p>
									</div>
								</div><!-- End_Module_437 -->
							</div>
						</div>
					</div>
				</div>
            </div>

    
</asp:Content>
