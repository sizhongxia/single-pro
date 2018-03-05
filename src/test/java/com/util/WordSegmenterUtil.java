package com.util;

import java.util.ArrayList;
import java.util.List;

import org.apdplat.word.WordSegmenter;
import org.apdplat.word.analysis.EditDistanceTextSimilarity;
import org.apdplat.word.analysis.Hit;
import org.apdplat.word.analysis.Hits;
import org.apdplat.word.segmentation.SegmentationAlgorithm;
import org.apdplat.word.segmentation.Word;
import org.apdplat.word.tagging.SynonymTagging;

public class WordSegmenterUtil {
	public static void main(String[] args) throws Exception {

		EditDistanceTextSimilarity distanceTextSimilarity = new EditDistanceTextSimilarity();

		List<Word> list = new ArrayList<>();
		list.add(new Word("北京"));
		list.add(new Word("世界"));
		list.add(new Word("您好"));
		list.add(new Word("一切"));
		list.add(new Word("中国"));
		list.add(new Word("下雨"));
		list.add(new Word("夏邑"));
		list.add(new Word("窗帘"));
		list.add(new Word("华都"));
		list.add(new Word("年化"));
		list.add(new Word("你们"));
		list.add(new Word("好人"));
		list.add(new Word("里绿"));
		list.add(new Word("利率"));
		list.add(new Word("利息"));

		SynonymTagging.process(list);
		System.out.println(list);
		List<String> ws = new ArrayList<>();
		for (Word word : list) {
			ws.add(word.getText());
			List<Word> ls2 = word.getSynonym();

			if (distanceTextSimilarity.isSimilar("利率", word.getText())) {
				System.out.println(word.getText());

			} else {
				for (Word word2 : ls2) {
					if (distanceTextSimilarity.isSimilar("利率", word2.getText())) {
						System.out.println(word.getText() + "[" + word2.getText() + "]");
						break;
					} else {
						System.out.println(word2.getText());
					}
				}
			}

		}

		// Hits hits = distanceTextSimilarity.rank("利率", ws);
		// List<Hit> ls = hits.getHits();
		// for (Hit hit : ls) {
		// System.out.println(hit.getText() + ", " + hit.getScore());
		// }

		/**
		 * 正向最大匹配算法：MaximumMatching 逆向最大匹配算法：ReverseMaximumMatching
		 * 正向最小匹配算法：MinimumMatching 逆向最小匹配算法：ReverseMinimumMatching
		 * 双向最大匹配算法：BidirectionalMaximumMatching
		 * 双向最小匹配算法：BidirectionalMinimumMatching
		 * 双向最大最小匹配算法：BidirectionalMaximumMinimumMatching 全切分算法：FullSegmentation
		 * 最少词数算法：MinimalWordCount 最大Ngram分值算法：MaxNgramScore
		 */
		// String word = "可以自动检测自定义用户词库和自定义停用词库的变化";
		//
		// List<Word> words = WordSegmenter.seg(word,
		// SegmentationAlgorithm.MaximumMatching);
		// SynonymTagging.process(words);
		// System.out.println(words);
		// words = WordSegmenter.seg(word,
		// SegmentationAlgorithm.ReverseMaximumMatching);
		// SynonymTagging.process(words);
		// System.out.println(words);
		// words = WordSegmenter.seg(word,
		// SegmentationAlgorithm.MinimumMatching);
		// SynonymTagging.process(words);
		// System.out.println(words);
		// words = WordSegmenter.seg(word,
		// SegmentationAlgorithm.ReverseMinimumMatching);
		// SynonymTagging.process(words);
		// System.out.println(words);
		// words = WordSegmenter.seg(word,
		// SegmentationAlgorithm.BidirectionalMaximumMatching);
		// SynonymTagging.process(words);
		// System.out.println(words);
		// words = WordSegmenter.seg(word,
		// SegmentationAlgorithm.BidirectionalMinimumMatching);
		// SynonymTagging.process(words);
		// System.out.println(words);
		// words = WordSegmenter.seg(word,
		// SegmentationAlgorithm.BidirectionalMaximumMinimumMatching);
		// SynonymTagging.process(words);
		// System.out.println(words);
		// words = WordSegmenter.seg(word,
		// SegmentationAlgorithm.FullSegmentation);
		// SynonymTagging.process(words);
		// System.out.println(words);
		// words = WordSegmenter.seg(word,
		// SegmentationAlgorithm.MinimalWordCount);
		// SynonymTagging.process(words);
		// System.out.println(words);
		// words = WordSegmenter.seg(word, SegmentationAlgorithm.MaxNgramScore);
		// SynonymTagging.process(words);
		// System.out.println(words);
	}
}
