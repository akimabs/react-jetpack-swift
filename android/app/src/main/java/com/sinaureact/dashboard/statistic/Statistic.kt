package com.sinaureact.dashboard.statistic

import android.content.Intent
import android.os.Build
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.OnBackPressedDispatcher
import androidx.activity.compose.setContent
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.*
import androidx.compose.material.ripple.rememberRipple
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.unit.sp
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.painter.ColorPainter
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import com.sinaureact.R
import com.sinaureact.theme.Colors
import kotlin.random.Random

class StatisticActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val data = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            intent.getSerializableExtra("data", ArrayList::class.java) as ArrayList<Any>?
        } else {
            intent.getSerializableExtra("data") as ArrayList<Any>?
        }

        setContent {
            StatisticScreen(onBackPressedDispatcher, data)
        }
    }
}


@Composable
fun StatisticScreen(backDispatcher: OnBackPressedDispatcher, data: ArrayList<Any>?) {
    val context = LocalContext.current
    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(Colors.whiteCustom)
    ) {
        TopAppBar(
            title = {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.Start,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Box(
                        modifier = Modifier
                            .size(60.dp)
                            .clip(shape = RoundedCornerShape(10.dp))
                            .background(Colors.whiteCustom)
                            .clickable(
                                interactionSource = remember { MutableInteractionSource() },
                                indication = rememberRipple(color = Color.Gray, radius = 100.dp)
                            ) {
                                onBackPressed(backDispatcher)
                            },
                        contentAlignment = Alignment.Center,
                    ) {
                        Image(
                            painter = painterResource(id = R.drawable.ic_arrow_left),
                            contentDescription = "Back",
                            modifier = Modifier
                                .size(30.dp)
                                .clip(shape = RoundedCornerShape(10.dp))
                        )
                    }
                    Spacer(modifier = Modifier.width(5.dp))
                    Text(
                        text = "Back",
                        color = Color.Black,
                        fontWeight = FontWeight.Bold,
                    )
                }
            },
            backgroundColor = Colors.whiteCustom,
            elevation = 0.dp
        )
        HeaderLayout()
        Spacer(modifier = Modifier.height(20.dp))
        WrapperChart(data)
    }
}

@Composable
fun HeaderLayout() {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .background(Colors.whiteCustom),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = "Statistic",
            color = Color.Black,
            fontWeight = FontWeight.Bold,
            fontSize = 40.sp
        )
        Text(
            text = "+Rp12.000/last week",
            color = Color.Gray,
            fontSize = 16.sp,
            modifier = Modifier.padding(top = 10.dp, bottom = 10.dp)
        )
    }
}

@Composable
fun WrapperChart(data: ArrayList<Any>?) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .height(250.dp)
            .background(Colors.whiteCustom)
            .padding(horizontal = 30.dp),
        verticalArrangement = Arrangement.Bottom
    ) {
        LazyRow(
            modifier = Modifier
                .fillMaxWidth()
                .height(250.dp),
            horizontalArrangement = Arrangement.Center,
            verticalAlignment = Alignment.Bottom
        ) {
            items(data.orEmpty().toList()) { item ->
                ChartItem(item)
                Spacer(modifier = Modifier.width(4.dp))
            }
        }
    }
}

@Composable
fun ChartItem(item: Any) {
    val configuration = LocalConfiguration.current
    val screenWidth = configuration.screenWidthDp.dp
    var isTooltipVisible by remember { mutableStateOf(false) }

    if (item is Map<*, *>) {
        val amount = (item["amount"] as? Number)?.toDouble()
        val calculateHeight = amount?.times(0.02)?.toInt()
        Box(modifier = Modifier) {
            Box(
                modifier = Modifier
                    .height((calculateHeight?.dp) ?: 0.dp)
                    .width((screenWidth.div(9.5f)))
                    .clip(shape = RoundedCornerShape(10.dp))
                    .background(if (isTooltipVisible) Colors.yellowCustom else Color.Transparent)
                    .clickable(
                        interactionSource = remember { MutableInteractionSource() },
                        indication = rememberRipple(color = Color.Gray, radius = 100.dp)
                    ) {
                        isTooltipVisible = !isTooltipVisible
                    }
            ) {
                Image(
                    painter = ColorPainter(if (isTooltipVisible) Colors.yellowCustom else Colors.greenCustom),
                    contentDescription = null,
                    modifier = Modifier.fillMaxSize()
                )
            }

            // Tooltip
            if (isTooltipVisible) {
                Surface(
                    modifier = Modifier
                        .align(Alignment.TopCenter)
                        .width(screenWidth / 10)
                        .offset(y = -(40.dp)),
                    color = Color.DarkGray,
                    shape = RoundedCornerShape(4.dp)
                ) {
                    Box(
                        modifier = Modifier.padding(vertical = 8.dp)
                    ) {
                        Text(
                            text = "Rp${calculateHeight}k",
                            color = Color.White,
                            textAlign = TextAlign.Center,
                            fontSize = 10.sp,
                            modifier = Modifier
                                .fillMaxWidth()
                                .wrapContentHeight()
                        )
                    }
                }
            }
        }
    }
}

private fun onBackPressed(backDispatcher: OnBackPressedDispatcher) {
    backDispatcher.onBackPressed()
}
private fun generateRandomHeight(): Int {
    return Random.nextInt(150) + 50
}