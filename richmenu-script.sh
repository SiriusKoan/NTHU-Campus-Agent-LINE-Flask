# 用來在 LINE 開發者平台上設定、上傳自定義的圖文選單。
# 第一個 curl 建立一個新的圖文選單，其中包含了選單的大小、是否選中、名稱、聊天室文字和各個區域的功能。
curl -v -X POST https://api.line.me/v2/bot/richmenu \
-H 'Authorization: Bearer ${LINE_OFFICIAL_TOKEN}' \
-H 'Content-Type: application/json' \
-d \
'{
    "size": {
      "width": 2500,
      "height": 1686
    },
    "selected": false,
    "name": "index",
    "chatBarText": "呼叫情報員",
    "areas": [
      {
          "bounds": {
              "x": 0,
              "y": 0,
              "width": 834,
              "height": 843
          },
          "action": {
              "type": "message",
              "text": "[選單]校園公車時間表"
          }
      },
      {
          "bounds": {
              "x": 834,
              "y": 0,
              "width": 833,
              "height": 843
          },
          "action": {
              "type": "message",
              "text": "[選單]清華校內工讀"
          }
      },
      {
          "bounds": {
              "x": 1667,
              "y": 0,
              "width": 833,
              "height": 843
          },
          "action": {
              "type": "message",
              "text": "[選單]切換主動推播"
          }
      },
      {
          "bounds": {
              "x": 0,
              "y": 843,
              "width": 834,
              "height": 843
          },
          "action": {
              "type": "message",
              "text": "[選單]校務專區"
          }
      },
      {
          "bounds": {
              "x": 834,
              "y": 843,
              "width": 833,
              "height": 843
          },
          "action": {
              "type": "message",
              "text": "[選單]校園地圖查詢"
          }
      },
      {
          "bounds": {
              "x": 1667,
              "y": 843,
              "width": 833,
              "height": 843
          },
          "action": {
              "type": "message",
              "text": "!"
          }
      }
  ]
}'

# 用來上傳圖文選單的圖片。
curl -v -X POST https://api-data.line.me/v2/bot/richmenu/richmenu-02fd8dc39fdeb6acb99d6d8f920e3a80/content \
-H "Authorization: Bearer ${LINE_OFFICIAL_TOKEN}" \
-H "Content-Type: image/png" \
-T richmenu-index-vRE.png

# 用來將圖文選單套用到所有的使用者上。
curl -v -X POST https://api.line.me/v2/bot/user/all/richmenu/richmenu-19682466851b21e2d7c0ed482ee0930f \
-H 'Authorization: Bearer {channel access token}'
-H 'Content-Length: 0'