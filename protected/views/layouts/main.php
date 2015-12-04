<?php /* @var $this Controller */ ?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="language" content="en">

        <!-- blueprint CSS framework -->
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/screen.css" media="screen, projection">
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/print.css" media="print">
        <!--[if lt IE 8]>
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/ie.css" media="screen, projection">
        <![endif]-->

        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css">
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css">

        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/views/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/views/css/style.css">

        <?php Yii::app()->clientScript->registerCssFile(Yii::app()->clientScript->getCoreScriptUrl().'/jui/css/base/jquery-ui.css'); ?>

        <title><?php echo CHtml::encode($this->pageTitle); ?></title>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">Music Player</a>
                    </div>
                </div>
            </nav>
        <div class="container-fluid content">
            <?php echo $content; ?>
        </div>
        <footer>

        </footer><!-- footer -->

        <script type="text/javascript">
            g = {};
            g.baseUrl = '<?php echo Yii::app()->request->getBaseUrl(true); ?>';
        </script>
        <?php
            Yii::app()->getClientScript()->registerCoreScript('jquery');
            Yii::app()->getClientScript()->registerCoreScript('jquery.ui');
        ?>
        <script src="<?php echo Yii::app()->theme->baseUrl; ?>/views/js/script.js"></script>
    </body>
</html>
