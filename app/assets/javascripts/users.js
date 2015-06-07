$(document).ready(function () {
    $("#achivment_achive_type").change(function () {
        if (this.value == "run"||this.value == "walk") {
            $('#achivment_content').show();
            $('#achivment_start').show();
            $('#achivment_finish').show();
            $('#achivment_time').show();
            $('#achivment_count').show();
        } else if (this.value == "medium") {
            $('#achivment_content').show();
            $('#achivment_count').show();
        } else {
            $('#achivment_content').hide();
            $('#achivment_start').hide();
            $('#achivment_finish').hide();
            $('#achivment_count').hide();
        }

    });
});
