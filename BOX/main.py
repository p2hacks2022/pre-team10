# 必要なライブラリのインポート
import cv2
import datetime
import qrcode

count = 1


def main():
    global count
    cap = cv2.VideoCapture(0)

    before = None
    time = datetime.date.today()
    
    print("動体検知を開始")
    print(str(datetime.datetime.now()))

    while True:
        # 画像を取得
        ret, frame = cap.read()

        # 再生が終了したらループを抜ける
        if ret == False:
            break

        # 白黒画像に変換
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

        if before is None:
            before = gray.astype("float")
            continue

        # 現在のフレームと移動平均との差を計算
        cv2.accumulateWeighted(gray, before, 0.5)
        frameDelta = cv2.absdiff(gray, cv2.convertScaleAbs(before))

        # frameDeltaの画像を２値化
        thresh = cv2.threshold(frameDelta, 3, 255, cv2.THRESH_BINARY)[1]
        
        # 輪郭のデータを取得
        contours = cv2.findContours(thresh,
                        cv2.RETR_EXTERNAL,
                        cv2.CHAIN_APPROX_SIMPLE)[0]

        # 差分があった点を画面に描画
        for target in contours:
            x, y, w, h = cv2.boundingRect(target)
            
            # 小さい変更点は無視
            if w < 100:
                continue 

            areaframe = cv2.rectangle(frame, (x, y), (x+w, y+h), (0,255,0), 2)



        # ウィンドウで表示
        cv2.imshow('target_frame', frame)

        # Enterキーが押されたらループを抜ける
        if cv2.waitKey(1) == 13: break
        

    print("動体検知を終了します。")
    print(str(datetime.datetime.now()))

    # ウィンドウの破棄
    cv2.destroyAllWindows()
    
    
if __name__ == '__main__':
    main()