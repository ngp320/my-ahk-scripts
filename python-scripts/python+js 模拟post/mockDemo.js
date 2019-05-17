// 使用 Mock
var Mock = require('mockjs')

var data = Mock.mock({

    'iotTempId'    : /\d\d/,
    'state'        : /1/,
    'temperature'  : /\d\d/,
    'location'     : /x:\d\d, y:\d\d/

    // 'iotTempId':      '123',
    // 'state':          '1',
    // 'temperature':    '34',
    // 'location':       'x:1,y:2'
})


function getMockDate() {
    // jsonStr = JSON.stringify(data, null, 4);
    // // console.log(jsonStr)
    // return jsonStr;
    // 如果由python调用, 则留到python里处理成json
    return data;
}



// function sleep(ms) {
 // return new Promise(resolve => setTimeout(resolve, ms))
// }

// // 输出结果
// function runEvery2Sec() { 
 // // 1000 * 2 = 2 秒钟
 // setTimeout( runEvery2Sec, 1000 * 2 ); 
// }
// runEvery2Sec()