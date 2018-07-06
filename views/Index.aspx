<%@ Page Language="AVR" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Index.aspx.vr" Inherits="views_Index" Title="Untitled Page" %>
<%@ Import Namespace="System.Data" %> 

<asp:Content ID="Content2" ContentPlaceHolderID="HeadPlaceholder" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyPlaceHolder" Runat="Server">
    <div class="container">

        <div style="width: 800px;margin-top: 2rem;">
            <asp:ListView ID="listviewCustomers" runat="server" OnItemCommand="listviewCustomersRowAction">
                <LayoutTemplate>

                    <div class="row">
                        <div class="col-sm heading">
                            Name
                        </div>
                        <div class="col-md heading">
                            City, State, Zip
                        </div>
                        <div class="col-sm heading">
                            Actions
                        </div>
                    </div>
                
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                </LayoutTemplate>

                <ItemTemplate>
                    <div class="row">
                        <div class="col-sm">
                            <%# (Container.DataItem *As Customer).FirstName.Trim() ++ 
                                " " ++ 
                                (Container.DataItem *As Customer).LastName.Trim() %>
                        </div>
                        <div class="col-md">
                            <%# (Container.DataItem *As Customer).City.Trim() ++ 
                                " " ++ 
                                (Container.DataItem *As Customer).State.Trim() ++ 
                                " " ++ 
                                (Container.DataItem *As Customer).ZipCode.ToString("00000") %>
                        </div>
                        <div class="col-sm">
                            <asp:LinkButton ID="linkbuttonUpdate" class="btn btn-primary btn-tiny" runat="server" 
                                 CommandArgument="<%# Container.DisplayIndex %>" CommandName="updaterow">Update</asp:LinkButton>
                            <asp:LinkButton ID="linkbuttonEmail" class="btn btn-primary btn-tiny" runat="server" 
                                 CommandArgument="<%# Container.DisplayIndex %>" CommandName="sendemail">Email</asp:LinkButton>
                        </div>                    
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>

    <!-- End of BodyPlaceHolder -->
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptPlaceholder" Runat="Server">
</asp:Content>

