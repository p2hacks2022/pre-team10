import tkinter
from PIL import Image, ImageTk
import threading
import time
import cv2
import qrcode

from Crypto.PublicKey import RSA
from Crypto.Cipher import PKCS1_v1_5

import uuid

frameCount = 0

def motion():
    
    global frameCount
    cap = cv2.VideoCapture(0)

    before = None

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
            if w < 150:
                continue 

            areaframe = cv2.rectangle(frame, (x, y), (x+w, y+h), (0,255,0), 2)

            #print(frameCount)
            frameCount += 1
            if frameCount > 20:
                cv2.destroyAllWindows()
                frameCount = 0
                return 1

        '''# ウィンドウで表示
        cv2.imshow('target_frame', frame)

        # Enterキーが押されたらループを抜ける
        if cv2.waitKey(1) == 13:
            break'''

def makeQR(number):
    pubkey = RSA.importKey(open('public-key.pem').read())
    #pubkeyを使って暗号化
    cipher_rsa = PKCS1_v1_5.new(pubkey)#pubkeyを読み込み
    #trashBoxIDは適当なものをお願いします
    #.new(pubkey)#pubkeyを読み込み
    trashId = uuid.uuid1()
    toEncrypt = '{"trashId":"'+ str(trashId) +'","trashBoxId":"%void%","count":"1"}'
    encrypted = cipher_rsa.encrypt(bytes(toEncrypt, 'utf-8'))#暗号化
    #trashIdは毎回UUIDを生成して
    encrypted_bytes_array=[int(x) for x in encrypted]
    # print(encrypted_bytes_array)
    #ほかの言語でも使えるように文字列に変換する
    #一つの要素を二桁の16進数に変換
    encrypted_hex = [hex(x)[2:].zfill(2) for x in encrypted_bytes_array]
    #16進数の文字列を連結
    encrypted_hex = ''.join(encrypted_hex)
    # print(encrypted_hex)
    # print(len(encrypted_hex)/2)
    #256になってなきゃだめ，必ず確認
    #なってない場合は，どこかしら間違ってる

    img = qrcode.make(
        'https://test.com/test/'+encrypted_hex,
        box_size = 20
    )
    
    #img = qrcode.make(number, box_size = 11)
    img.save('./src/result.png')
    imgName = './src/result.png'
    return imgName

def show_image():
    global item, canvas

    root = tkinter.Tk()
    #root.title('test')
    #root.overrideredirect(True)
    #fullscreen
    #root.geometry("1000x1000")
    root.attributes("-zoomed", True) 
    root.wm_attributes('-type', 'splash')

    windowWidth = root.winfo_screenwidth()
    windowHeight = root.winfo_screenheight()
    
    img = Image.open('./src/waitScreen.png')
    img = ImageTk.PhotoImage(img)
    canvas = tkinter.Canvas(width=windowWidth, height=windowHeight, bg="#fff")
    canvas.place(x=windowWidth/2,y=windowHeight/2,anchor='center')
    item = canvas.create_image(windowWidth/2,windowHeight/2,image=img, anchor='center')
    root.mainloop()

#setup thread
thread1 = threading.Thread(target=show_image)
thread1.start()


while True:
    isMotion = motion()
    imgPath = makeQR(isMotion)

    #def change img
    imgQR = Image.open(imgPath)
    imgQR = ImageTk.PhotoImage(imgQR)
    print('show image')

    #change item
    canvas.itemconfig(item,image=imgQR)
    time.sleep(5)

    #reverse item
    img = Image.open('./src/waitScreen.png')
    img = ImageTk.PhotoImage(img)
    canvas.itemconfig(item,image=img)
    print('close image')
    
    