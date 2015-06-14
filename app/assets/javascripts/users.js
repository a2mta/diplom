$(document).ready(function () {
    $("#achivment_achive_type").change(function () {
        if (this.value == "run"||this.value == "walk") {
            $('#achivment_count').hide();
            $('.achivment_achive_content_info').show();
            $('.achivment_start_info').show();
            $('.achivment_finish_info').show();
            $('#achivment_achive_content').show();
            $('#achivment_start').show();
            $('#achivment_achive_photo').show();
            $('#achivment_finish').show();
            $('#achivment_time').show();
        } else if (this.value == "medium") {
            $('.achivment_achive_content_info').show();
            $('#achivment_achive_content').show();
            $('#achivment_count').show();
            $('#achivment_achive_photo').show();
            $('.achivment_start_info').hide();
            $('.achivment_finish_info').hide();
            $('#achivment_start').hide();
            $('#achivment_finish').hide();
            $('#achivment_time').hide();

        } else {
            $('#achivment_achive_photo').hide();
            $('.achivment_achive_content_info').hide();
            $('.achivment_start_info').hide();
            $('.achivment_finish_info').hide();
            $('#achivment_achive_content').hide();
            $('#achivment_start').hide();
            $('#achivment_finish').hide();
            $('#achivment_count').hide();
            $('#achivment_time').hide();
        }

    });
});
