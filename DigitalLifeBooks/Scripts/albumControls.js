

(function () {
    $(document).ready(function () {
        $("div.album a.upload").click(function () {
            var link = $(this);
            var albumId = link.parent().attr("data-albumId");
            var iframe = $("<iframe src=/Albums/Upload.aspx?AlbumId=" + albumId + "/>");
            $("body").append(iframe);
            iframe.dialog();

            window.closeIframe = function () {
                iframe.dialog('close');
                document.location.reload(true);
                return false;
            }
        });

        $("a.newAlbum").click(function () {
            var link = $(this);
            var childId = link.attr("data-childId");
            var iframe = $("<iframe src=/Albums/NewOrEditAlbum.aspx?ChildId=" + childId + "/>");
            $("body").append(iframe);
            iframe.dialog();

            window.closeIframe = function () {
                iframe.dialog('close');
                document.location.reload(true);
                return false;
            }
        });

        $("a.delete").click(function () {
            var link = $(this);
            var id = link.attr("data-entityId");
            var type = link.attr("data-entityType");

            $.post('/Services/Delete.asmx/DeleteEntity', "EntityType=" + type + "&EnityID=" + id, function (data) {
                document.location.reload(true);
            });
        });

    });


})()