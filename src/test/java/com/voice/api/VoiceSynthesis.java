//package com.voice.api;
//
//import com.iflytek.cloud.speech.SpeechConstant;
//import com.iflytek.cloud.speech.SpeechError;
//import com.iflytek.cloud.speech.SpeechSynthesizer;
//import com.iflytek.cloud.speech.SpeechUtility;
//import com.iflytek.cloud.speech.SynthesizeToUriListener;
//
//public class VoiceSynthesis {
//
//	public static void main(String[] args) {
//		SpeechUtility.createUtility(SpeechConstant.APPID + "=5a5dfc81 ");
//
//		// // 1.创建SpeechSynthesizer对象
//		// SpeechSynthesizer mTts = SpeechSynthesizer.createSynthesizer();
//		// // 2.合成参数设置，详见《MSC Reference Manual》SpeechSynthesizer 类
//		// mTts.setParameter(SpeechConstant.VOICE_NAME, "xiaoyan");// 设置发音人
//		// mTts.setParameter(SpeechConstant.SPEED, "50");// 设置语速
//		// mTts.setParameter(SpeechConstant.VOLUME, "80");// 设置音量，范围0~100
//		// mTts.setParameter(SpeechConstant.SAMPLE_RATE, "16k");
//		// mTts.setParameter(SpeechConstant.AUDIO_FORMAT, "wav");
//		// // 设置合成音频保存位置（可自定义保存位置），保存在“./tts_test.pcm”
//		// // 如果不需要保存合成音频，注释该行代码
//		// mTts.setParameter(SpeechConstant.TTS_AUDIO_PATH, "./tts_test.wav");
//		//
//		// // 合成监听器
//		// SynthesizerListener mSynListener = new SynthesizerListener() {
//		//
//		// @Override
//		// public void onBufferProgress(int arg0, int arg1, int arg2, String arg3) {
//		// System.out.println("onBufferProgress");
//		// }
//		//
//		// @Override
//		// public void onCompleted(SpeechError arg0) {
//		// System.out.println(arg0);
//		// System.out.println("onCompleted");
//		// }
//		//
//		// @Override
//		// public void onEvent(int arg0, int arg1, int arg2, int arg3, Object arg4,
//		// Object arg5) {
//		// System.out.println("onEvent");
//		// }
//		//
//		// @Override
//		// public void onSpeakBegin() {
//		// System.out.println("onSpeakBegin");
//		// }
//		//
//		// @Override
//		// public void onSpeakPaused() {
//		// System.out.println("onSpeakPaused");
//		// }
//		//
//		// @Override
//		// public void onSpeakProgress(int arg0, int arg1, int arg2) {
//		// System.out.println("onSpeakProgress: " + arg0 + "," + arg1 + "," + arg2);
//		// }
//		//
//		// @Override
//		// public void onSpeakResumed() {
//		// System.out.println("onSpeakResumed");
//		// }
//		// };
//		// // 3.开始合成
//		// mTts.startSpeaking("语音合成测试程序", mSynListener);
//
//		// 1.创建SpeechSynthesizer对象
//		SpeechSynthesizer mTts = SpeechSynthesizer.createSynthesizer();
//		// 2.合成参数设置，详见《MSC Reference Manual》SpeechSynthesizer 类
//		mTts.setParameter(SpeechConstant.VOICE_NAME, "xiaoyan");// 设置发音人
//		mTts.setParameter(SpeechConstant.SPEED, "50");// 设置语速，范围0~100
//		mTts.setParameter(SpeechConstant.PITCH, "50");// 设置语调，范围0~100
//		mTts.setParameter(SpeechConstant.VOLUME, "50");// 设置音量，范围0~100
//
//		// 合成监听器
//		SynthesizeToUriListener synthesizeToUriListener = new SynthesizeToUriListener() {
//			// progress为合成进度0~100
//			public void onBufferProgress(int progress) {
//				System.out.println("onBufferProgress: " + progress);
//			}
//
//			// 会话合成完成回调接口
//			// uri为合成保存地址，error为错误信息，为null时表示合成会话成功
//			public void onSynthesizeCompleted(String uri, SpeechError error) {
//				System.out.println(error);
//				System.out.println("onSynthesizeCompleted: " + uri);
//			}
//
//			@Override
//			public void onEvent(int arg0, int arg1, int arg2, int arg3, Object arg4, Object arg5) {
//
//			}
//		};
//		// 3.开始合成
//		// 设置合成音频保存位置（可自定义保存位置），默认保存在“./tts_test.pcm”
//		mTts.synthesizeToUri(" 设置合成音频保存位置（可自定义保存位置），默认保存在", "./tts_test.pcm", synthesizeToUriListener);
//
//	}
//
//}
