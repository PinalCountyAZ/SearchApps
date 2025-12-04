<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inmate-Details.aspx.cs" Inherits="Search.Inmate_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Inmate Details</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="robots" content="noindex" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />

    <!-- Project CSS files -->
    <link rel="stylesheet" href="css/site.css" type="text/css" />
    <link rel="stylesheet" media="print" href="css/print.css" />

    <!-- Tooltips (i) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>

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
    <div class="details-page">
        <div class="container">
            <div class="header-banner">
                <a href="https://www.pinal.gov/772/Sheriffs-Office"><asp:Image CssClass="header-image img-fluid" runat="server" ImageUrl="./images/Logo.png" /></a>
                <h4 class="header-title">Sheriff's Office</h4>
                <hr class="header-title" />
                <h2 class="header-title">Inmate Search</h2>
            </div>
            <form id="form1" runat="server">
                <div class="header-buttons">
                    <div class="col text-right">
                        <asp:Button ID="btnBack" CssClass="btn button-primary button-responsive" runat="server" Text="New Search" OnClick="btnBack_Click" />
                    </div>
                </div>
                <div class="content">
                    <h5 class="header-title">INMATE DETAILS</h5>
                    <!-- Inmate Details -->
                    <div class="details-section">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="detail">
                                    <asp:Image ID="imgInmate" class="img-fluid" CssClass="img-thumbnail" runat="server" /></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="details-title">Inmate ID</div>
                                <div class="detail mb-1">
                                    <asp:Label ID="lblInmateID" runat="server" />
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="details-title">NAME</div>
                                <div class="detail mb-4">
                                    <asp:Label ID="lblName" runat="server" />
                                </div>
                            </div>
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
