package com.shpun.service;

import com.shpun.pojo.Score;

import java.util.List;

public interface ScoreService {

    int insertScore(Score score);

    int deleteScore(Score score);

    int updateScore(Score score);

    List<Score> searchFromScore(String s);

    Score selectScoreById(Score score);

    List<Score> selectAllScores();

}
