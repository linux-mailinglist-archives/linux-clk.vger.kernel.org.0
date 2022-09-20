Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69ABC5BEAB1
	for <lists+linux-clk@lfdr.de>; Tue, 20 Sep 2022 18:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbiITQCB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 20 Sep 2022 12:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbiITQB3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Sep 2022 12:01:29 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ACFA5AA22;
        Tue, 20 Sep 2022 09:01:27 -0700 (PDT)
Received: from [192.168.1.138] ([37.4.248.18]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MYvPq-1onmhJ3KTo-00Urvo; Tue, 20 Sep 2022 18:01:09 +0200
Message-ID: <688777fc-e6af-8cbe-b19d-c531a7a66b32@i2se.com>
Date:   Tue, 20 Sep 2022 18:01:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/7] firmware: raspberrypi: Move the clock IDs to the
 firmware header
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Scott Branden <sbranden@broadcom.com>,
        Stephen Boyd <sboyd@kernel.org>, Emma Anholt <emma@anholt.net>,
        Ray Jui <rjui@broadcom.com>, Maxime Ripard <mripard@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
References: <20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech>
 <20220815-rpi-fix-4k-60-v2-2-983276b83f62@cerno.tech>
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220815-rpi-fix-4k-60-v2-2-983276b83f62@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:BMJbLZFlz3GApiFfjEz3NrS77SCCBYOpm8x1SZNvBf/sPUv2bjl
 yGngIQPx/zKjhQAqhy7bHLQT0zA/9l39u7GvalXhSO7fs+ORg5beqK0wg/1KDFz2pA5yswl
 UmaLwSYihGXSm3hFwSxRbcfFVYUEPCchcD5OvVxuPx7gGgSJkNQ2nTuz4WJkuiTGjzR4ZP2
 FTfNbxZ6XAJ9xPPJJWU9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:R1m/G7E0AnU=:nPGL4HIR3e+Q2MSI5Zjc5S
 4+gRfiLRFYbwycGCtG/OUM/q2FC7nNgHxJYE4I2BAs8jY9Iv92BSGsV0KcWBLofUjk4469O3E
 A/YZ/hBoWrxSFItWVmdTHBVGJYiYLw2uboRgDVESHJxeEiZtCbIsujLuYaOXr5e7d4OJcPkqR
 QPpgOr9pelOgV0SOi0ylywzbUMsrfvKFrhzXOULR7+BvYyMdBmfcqd6toH8p96FDXfgfFzQYI
 ShIhlxa6RJYauRLn189Q24wpt7sFGSNs/uZocBtALtn8pPZjZLvag4Rc6WbyxIt0qFYK6I6Io
 wgQSwe4rtJUrb91/p8HdmBZgNgaG6Y+ZgHRErNxlgj+kbOD5w5+lKTWxllVx89oa3e4t0SF3u
 8FRaPu/A71tBqeYg0pHjHGcV9mKejwle2F2yjlcub1/jo2wR0E8a9a3pjIzhdp8k3rT1dSxj4
 Ne8CvBdvy2Xff7j2qeaGOnnGcMzdLhiGLcRxM8vPUXE9ZWdrAm0Fhkzh3qXaf1v2ByMU/G5WV
 EvKyWH/6zAR5OzhNeOktRXTUsOA35LaEZ/oCSc/nMqLNNycGulZ6uHo7Jild27lwJ+SofMpYG
 lOf0IkGlGVsgdEAghUZ3nSVY5jxdEwNWyTXddW5sqFbfB+bp9rj86NfQc6fTM464ztk9tQb4h
 1fj0OhtC7CDo8wvEsGtb89nOqGhXCqdV0IWXnCES/82ZaQg4xnNJJm1KivlGR2bQEnKtxEtwF
 Riu4MivWDjEj3m52JSSlVFqHB3TD/vbqEBI/88PG7GDPZQwNOHu+ANxqLWbi+IIjijZvu0KR7
 h+lOk0M
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

Am 20.09.22 um 14:50 schrieb Maxime Ripard:
> We'll need the clock IDs in more drivers than just the clock driver from
> now on, so let's move them in the firmware header.

recently as i reviewed the clk-raspberrypi i noticed this, too. But from 
my point of view the clock ids should go to include/dt-bindings/clock 
(like bcm2835.h) because these clock ids are actually referenced in the 
DTS files and we need to make sure they are in sync. AFAIR this would 
also result in change from enum to defines.

Sorry, i didn't had the time to send a patch for this.

>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
> index 876b37b8683c..1f5e6a1554e6 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -18,24 +18,6 @@
>   
>   #include <soc/bcm2835/raspberrypi-firmware.h>
>   
> -enum rpi_firmware_clk_id {
> -	RPI_FIRMWARE_EMMC_CLK_ID = 1,
> -	RPI_FIRMWARE_UART_CLK_ID,
> -	RPI_FIRMWARE_ARM_CLK_ID,
> -	RPI_FIRMWARE_CORE_CLK_ID,
> -	RPI_FIRMWARE_V3D_CLK_ID,
> -	RPI_FIRMWARE_H264_CLK_ID,
> -	RPI_FIRMWARE_ISP_CLK_ID,
> -	RPI_FIRMWARE_SDRAM_CLK_ID,
> -	RPI_FIRMWARE_PIXEL_CLK_ID,
> -	RPI_FIRMWARE_PWM_CLK_ID,
> -	RPI_FIRMWARE_HEVC_CLK_ID,
> -	RPI_FIRMWARE_EMMC2_CLK_ID,
> -	RPI_FIRMWARE_M2MC_CLK_ID,
> -	RPI_FIRMWARE_PIXEL_BVB_CLK_ID,
> -	RPI_FIRMWARE_NUM_CLK_ID,
> -};
> -
>   static char *rpi_firmware_clk_names[] = {
>   	[RPI_FIRMWARE_EMMC_CLK_ID]	= "emmc",
>   	[RPI_FIRMWARE_UART_CLK_ID]	= "uart",
> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
> index 63426082bcb9..74c7bcc1ac2a 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> @@ -136,6 +136,24 @@ enum rpi_firmware_property_tag {
>   	RPI_FIRMWARE_GET_DMA_CHANNELS =                       0x00060001,
>   };
>   
> +enum rpi_firmware_clk_id {
> +	RPI_FIRMWARE_EMMC_CLK_ID = 1,
> +	RPI_FIRMWARE_UART_CLK_ID,
> +	RPI_FIRMWARE_ARM_CLK_ID,
> +	RPI_FIRMWARE_CORE_CLK_ID,
> +	RPI_FIRMWARE_V3D_CLK_ID,
> +	RPI_FIRMWARE_H264_CLK_ID,
> +	RPI_FIRMWARE_ISP_CLK_ID,
> +	RPI_FIRMWARE_SDRAM_CLK_ID,
> +	RPI_FIRMWARE_PIXEL_CLK_ID,
> +	RPI_FIRMWARE_PWM_CLK_ID,
> +	RPI_FIRMWARE_HEVC_CLK_ID,
> +	RPI_FIRMWARE_EMMC2_CLK_ID,
> +	RPI_FIRMWARE_M2MC_CLK_ID,
> +	RPI_FIRMWARE_PIXEL_BVB_CLK_ID,
> +	RPI_FIRMWARE_NUM_CLK_ID,
> +};
> +
>   #if IS_ENABLED(CONFIG_RASPBERRYPI_FIRMWARE)
>   int rpi_firmware_property(struct rpi_firmware *fw,
>   			  u32 tag, void *data, size_t len);
>
