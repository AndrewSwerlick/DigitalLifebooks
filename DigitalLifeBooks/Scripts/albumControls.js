

(function () {
    $(document).ready(function () {
        $("div.album a.upload").on('click', function (e) {
            var albumId = $(this).closest("div.album.row").data("albumid");
            var iframe = $("<iframe src=/Albums/Upload.aspx?AlbumId=" + albumId + "/>");
            window.closeIframe = function () {
                iframe.dialog('close');
                document.location.reload(true);
                return false;
            }
            $("body").append(iframe);
            iframe.dialog({
                draggable: false,
                height: 400,
                width: 996,
                modal: true,
                resizable: false,
                title: 'Upload'
            });


            e.preventDefault();
            return false;
        });

        $("a.newAlbum").on('click', function (e) {
            e.preventDefault();
            var link = $(this);
            var childId = $(this).data("childid");
            var iframe = $("<iframe src=/Albums/NewOrEditAlbum.aspx?ChildId=" + childId + "/>");
            window.closeIframe = function () {
                iframe.dialog('close');
                document.location.reload(true);
                return false;
            }
            $("body").append(iframe);
            iframe.dialog({
                draggable: false,
                height: 400,
                width: 996,
                modal: true,
                resizable: false,
                title: 'Edit'
            });

            return false;
        });

        $("a.delete").on('click', function (e) {
            e.preventDefault();
            if (!confirm("Are you sure you want to delete this item")) {
                return false;
            }

            var id = $(this).data("entityid");
            var type = $(this).data("entitytype");

            $.post('/Services/Delete.asmx/DeleteEntity', "EntityType=" + type + "&EnityID=" + id, function (data) {
                document.location.reload(true);
            });
            return false;
        });

        $("a.next").on('click', function (e) {
            var link = $(this);
            var pageToLoad = link.data("page");
            var albumId = $(this).closest("div.album.root").data("albumid");

        });

    });


})()