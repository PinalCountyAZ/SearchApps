<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inmate-Search.aspx.cs" Inherits="Search.Inmate_Search" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pinal County Sheriff Inmate Search</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />

    <!-- Project CSS files -->
    <link rel="stylesheet" href="css/site.css" type="text/css" />

    <!-- Google tag (gtag.js) -->
    <script async="async" src="https://www.googletagmanager.com/gtag/js?id=G-7Q6NTBLCK0"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());
        gtag('config', 'G-7Q6NTBLCK0');
    </script>
</head>

<body>
    <div class="search-page">
        <div class="container">
            <div class="header-banner">
                <a href="https://www.pinal.gov/772/Sheriffs-Office"><asp:Image CssClass="header-image img-fluid" runat="server" ImageUrl="./images/Logo.png" /></a>
                <h4 class="header-title">Sheriff's Office</h4>
                <hr class="header-title" />
                <h2 class="header-title mb-5">Inmate Search</h2>
            </div>
            <form runat="server">
                <h5 class="header-title">INMATE</h5>
                <div class="row">
                    <div class="col-lg-10 col-sm-12 align-self-center pb-2">
                        <asp:TextBox ID="txtLastName" CssClass="form-control" placeholder="LAST NAME or INMATE ID" runat="server" />
                    </div>
                    <div class="col-2 align-self-center pb-2">
                        <asp:Button ID="btnSearch" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="row ml-2">
                            <asp:Label ID="lblWarning" CssClass="alert-light" runat="server"></asp:Label>
                        </div>
                        <div class="row inmate-image-link">
                            <asp:Repeater ID="rptrInmates" runat="server">
                                <ItemTemplate>
                                    <%--<a href='<%# Eval("IMAGEPATH") %>' target="_blank">
                                        <div class="col repeater-inmates">
                                            <div class="row">
                                                <div class="col">
                                                    <asp:Image CssClass="inmate-image" ID="inmateImage" ImageUrl='<%# Eval("IMAGEPATH") %>' Width="300" runat="server" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <asp:Label ID="FIRSTINITIAL" Text='<%#Eval("FIRSTNAME").ToString().Substring(0,1) %>' runat="server"></asp:Label>
                                                    <asp:Label ID="INMATENAME" Text='<%#Bind("LASTNAME") %>' runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <asp:Label ID="INMATEID" Text='<%#Bind("INMATEID") %>' runat="server"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </a>--%>
                                    <div class="col repeater-inmates" style="margin:10px">
                                        <div class="row">
                                            <div class="col">
                                                <asp:Image CssClass="nmate-image" ID="inmateImage" ImageUrl="images/no-photo-available-icon.jpg" Width="200" runat="server" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <asp:Label ID="FIRSTINITIAL" Text='<%#Eval("FIRSTNAME").ToString().Substring(0,1) %>' runat="server"></asp:Label>
                                                <asp:Label ID="INMATENAME" Text='<%#Bind("LASTNAME") %>' runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <asp:Label ID="INMATEID" Text='<%#Bind("INMATEID") %>' runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <!-- Disclaimer -->
                    <div class="disclaimer mt-5">
                        <div>DISCLAIMER</div>
                        <p>
                            The search engine lists individuals who are currently incarcerated in the Pinal County Jail. Inclusion in this search does not indicate guilt, only that the individual is or has been incarcerated.
                        </p>
                        <p>
                            This information is updated every 60 minutes. When an individual's information is entered into the Pinal County Inmate data base, the information will be updated to this listing during the next regularly scheduled update. When an individual is released from jail, they will no longer appear in these listings.
                        </p>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/125e3f2ff2.js"></script>
</body>
</html>
