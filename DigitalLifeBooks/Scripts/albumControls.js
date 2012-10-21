

(function () {
    $(document).ready(function () {
        $("div.album a.upload").on('click', function (e) {
            var albumId = $(this).parent().data("albumId");
            var iframe = $("<iframe src=/Albums/Upload.aspx?AlbumId=" + albumId + "/>");
            $("body").append(iframe);
            iframe.dialog({
                draggable: false,
                height: 400,
                width: 996,
                modal: true,
                resizable: false,
                title: 'foo'
            });

            window.closeIframe = function () {
                iframe.dialog('close');
                document.location.reload(true);
                return false;
            }
            e.preventDefault();
        });

        $("a.newAlbum").on('click', function (e) {
            var link = $(this);
            var childId = $(this).data("childId");
            var iframe = $("<iframe src=/Albums/NewOrEditAlbum.aspx?ChildId=" + childId + "/>");
            $("body").append(iframe);
            iframe.dialog({
                draggable: false,
                height: 400,
                width: 996,
                modal: true,
                resizable: false,
                title: 'foo'
            });
            window.closeIframe = function () {
                iframe.dialog('close');
                document.location.reload(true);
                return false;
            }
            e.preventDefault();
        });

        $("a.delete").on('click', function (e) {
            var id = $(this).data("entityId");
            var type = $(this).data("entityType");

            $.post('/Services/Delete.asmx/DeleteEntity', "EntityType=" + type + "&EnityID=" + id, function (data) {
                document.location.reload(true);
            });
            e.preventDefault();
        });

    });


})()