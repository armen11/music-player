<?php

class HomeController extends Controller
{
	public function actionIndex()
	{
		$genreValues = range(0,10);
		$modelGenre = new Genre();
		$genreData = $modelGenre->findAll();

		$this->render('index',array(
				'genres' => $genreData,
				'genreValues' => $genreValues
			)
		);
	}

	/**
	 *
	 * @return bool
	 */
	public function actionGet()
	{
		if (!Yii::app()->request->isAjaxRequest) {
			Yii::app()->end();
		}

		$genreList = CHtml::listData(Yii::app()->db->createCommand()
                                   ->select('sg.genre_id AS id, COUNT(s.id) AS count')
                                   ->from('song_genre sg')
                                   ->leftJoin('songs s', 's.id = sg.song_id')
                                   ->group('sg.genre_id')
                                   ->queryAll(), 'id', 'count');

		$play_list = Yii::app()->request->getPost('play_list');
        $total = array_sum($play_list);
		$maxIndex = array_keys($play_list, max($play_list))[0];
		$totalPlayList = round($genreList[$maxIndex] * $total / $play_list[$maxIndex]);
        $songs = array();

		foreach($play_list as $key => $val){

            $songs = array_merge($songs, Yii::app()->db->createCommand()
                                                        ->select('s.name, g.title,  sg.genre_id')
                                                        ->from('song_genre sg')
                                                        ->leftJoin('songs s', 's.id = sg.song_id')
														->leftJoin('genre g', 'g.id = sg.genre_id')
                                                        ->where('sg.genre_id = :id', array(':id'=> $key))
                                                        ->order('RAND()')
                                                        ->limit(round($totalPlayList * $val / $total))
                                                        ->queryAll());
		}
		shuffle($songs);

        $this->renderPartial('play_list', array('songs' => $songs));
	}
}