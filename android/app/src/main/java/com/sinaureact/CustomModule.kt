// CustomModule.kt

package com.sinaureact

import android.content.Intent
import android.util.Log
import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import com.facebook.react.bridge.Arguments
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.ReadableArray
import com.sinaureact.dashboard.statistic.StatisticActivity

class CustomModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {
    private val reactContext: ReactApplicationContext = reactContext

    override fun getName(): String {
        return "CustomModule"
    }

    @ReactMethod
    fun navigateToStatistic(data: ReadableArray) {
        val intent = Intent(reactContext, StatisticActivity::class.java)
        intent.putExtra("data", data.toArrayList())
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
        reactContext.startActivity(intent)
    }

}