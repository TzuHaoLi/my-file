# 數位邏輯設計實習
>### 資工二1 李梓豪 1410932023  
>### 指導老師:林宏益  

---
##    [My Github](https://github.com/TzuHaoLi/my-file.git)  
## 實驗目的  
>驗證decoder3對8  
 
## 實驗步驟  
>1. 產生decoder2對4  
>2. 使用decoder2對4接出decoder3對8  
>3. 確認波形圖是否正確  

## 實驗討論  
>2-4 decoder有2個輸入埠In以及致能控制E，3-8 decoder有3個輸入埠In以及致能控制E，可以使用最高位(MSB)輸入In[2]當作控制，選擇其中哪個2-4 decoder運作。  








## 實驗結果  
>###    decoder_2_4.v  
``` verilog=
module decoder_2_4(E , In , Out);
input E;                            //宣告E為1bit的輸入埠
input [1:0] In;                     //宣告In為2bit的輸入埠
output [3:0]Out;                    //宣告Out為4bit的輸出埠
wire [3:0] Out;                     //宣告腳位資料型態  
assign Out = E ? 1'b1 << In : 4'h0; //如果E=1,Out = 0001 並左移In個位元
endmodule                           //如果E=0,不運作 Out全為0

```
>###    decoder_3_8.v
```verilog=
module decode_3_8(E , In , Out);
input E;                                            //宣告E為1bit的輸入埠
input [2:0] In;                                     //宣告In為3bit的輸入埠
output [7:0] Out;                                   //宣告Out為8bit的輸出埠
wire E1 , G1 , G2;                                  //宣告三條接線E1,G1,G2                        
not u1(E1 , In[2]);                                 //定義E1 = IN[2]的反向
and a1(G1 , E , In[2]);                             //定義G1 = E & In[2]
and a2(G2 , E , E1);                                //定義G2 = E & E1
decoder_2_4 block1(G1 , In[1 : 0] , Out[7 : 4]);    //使用decoder_2_4 控制線為G1 輸入為In[1:0] 輸出為Out[7:4]
decoder_2_4 block2(G2 , In[1 : 0] , Out[3 : 0]);    //使用decoder_2_4 控制線為G2 輸入為In[1:0] 輸出為Out[3:0]
endmodule
```  

>### 波型圖
    
![](https://i.imgur.com/v0HCbYC.png)  

## 實驗心得:  
>這次實驗了解到如何使用verilog來呈現電路圖上的邏輯元件，可以訓練邏輯思考能力，也讓我對verilog語法更加的熟悉。


