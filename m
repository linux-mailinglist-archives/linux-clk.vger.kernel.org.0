Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 746775FA233
	for <lists+linux-clk@lfdr.de>; Mon, 10 Oct 2022 18:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbiJJQxM (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 10 Oct 2022 12:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiJJQxL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Oct 2022 12:53:11 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1994A4C61B;
        Mon, 10 Oct 2022 09:53:09 -0700 (PDT)
Received: from [192.168.1.138] ([37.4.248.18]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MWiUg-1ofi0u2rqS-00X4lf; Mon, 10 Oct 2022 18:52:40 +0200
Message-ID: <dad7dc1b-c94a-4547-260f-5efe50d959e8@i2se.com>
Date:   Mon, 10 Oct 2022 18:52:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 3/7] firmware: raspberrypi: Provide a helper to query a
 clock max rate
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
 <20220815-rpi-fix-4k-60-v2-3-983276b83f62@cerno.tech>
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220815-rpi-fix-4k-60-v2-3-983276b83f62@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:xVuX/w3ngCM1Xs7bP8l36ga2yBUkRfiC5SZVOLDFVuhbEbaUOi8
 Ht7lb7ZE0v89ORFIUFBR3EcZ9hByi6Wj9zTVx7WihMoqFLggY4vIEi3SRcUo5lzctKBWVDl
 L8Gov+ZguoxDyaPpHg1BGnNdtyuV4Hhzy7JnX503K6i9Kqtpfv8Rh3VcY1VLf7i3vxUW7kD
 FfUhE94nGdfGvl/vyyTZg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5jfDTjv99BA=:IqmBkuyekdtld/M89dBtQF
 Re7hifvYF4SBrKs+GlGnEcCgnpAL27uhTcZxU6FwVTA1Atb1kKb3c6KYguBswF3V+LHTMFIE8
 iKC/Z25dkIn6jUSZcg+W8T5FLEat5RkJbiUpFM/YyWHDc1hG4ujgoLK9LuurOH7uiFdwIw2bw
 HizfQ8BBCHTJlpBNxhLDv9igdI3GKH3En7g6MXgd0q0Dtb+xFFS8luEGgozvqQXgIa1Yxufpr
 3RV8WkouAR7J1uqEDaJrPGHPxFIsmvn3PYzaL0DZQr04PCKdFHq9nZWDWv+atNLguhDzPY4Ox
 Q8/P4OhVfdSuAVD2dKtPVB+RHOK3PbeQX5PXUTnd5c8oZueCeG9AFZeblw/9S6xX0yecvr1Zn
 NsfpxZTGks4bNSTtS49ngIgIVvCa8VBTVG7N/QRNNVmJof5lLPQoxzpPneg8zr+1cPql7B/Xe
 3pBjaefrK4IfV+omLR/Y5WM7u0AtLKTjsKPFcR5J/CtBQGnoQ1NOjIXdWLVrHZ2lhdCaSFUzD
 a0eWFkkh5fsYlNdY3em51JWS0ZpllGLqZlFCiBHsonj53esckRkG/xtXWrSoCRPBJwrpYjO/Q
 6QW3BLaXZNvNd7eXY7+jMAOwxF+sh5qEJo8xdixvnvwki7jZqmXfTJASGhjVi7NrQg85mDKge
 Dj7HStZnsIgmNFYivHIjF5zCbnNkwk2qoEO7AmJ5EuoAd7ti9p3t6TuFcwr8B4aupReULQszC
 yp/oR6C1WX6AzW6Lco3hq4duehQwPdrVXCIntIJALv9JkZs3IfSXbeDD5mYKnC9z5eDzf4t9d
 0Z/ASLcbS5dnvytm4o+eTp6AuRPqw==
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

Am 20.09.22 um 14:50 schrieb Maxime Ripard:
> The firmware allows to query for its clocks the operating range of a
> given clock. We'll need this for some drivers (KMS, in particular) to
> infer the state of some configuration options, so let's create a
> function to do so.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
> index b916e1e171f8..c4b9ea70f5a7 100644
> --- a/drivers/firmware/raspberrypi.c
> +++ b/drivers/firmware/raspberrypi.c
> @@ -228,6 +228,21 @@ static void rpi_register_clk_driver(struct device *dev)
>   						-1, NULL, 0);
>   }
>   
> +unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int id)
> +{
> +	struct rpi_firmware_clk_rate_request msg =
> +		RPI_FIRMWARE_CLK_RATE_REQUEST(id);
> +	int ret;
> +
> +	ret = rpi_firmware_property(fw, RPI_FIRMWARE_GET_MAX_CLOCK_RATE,
> +				    &msg, sizeof(msg));
> +	if (ret)
> +		return 0;
> +
> +	return le32_to_cpu(msg.rate);
> +}
> +EXPORT_SYMBOL_GPL(rpi_firmware_clk_get_max_rate);
> +
>   static void rpi_firmware_delete(struct kref *kref)
>   {
>   	struct rpi_firmware *fw = container_of(kref, struct rpi_firmware,
> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
> index 74c7bcc1ac2a..10248c370229 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> @@ -154,12 +154,32 @@ enum rpi_firmware_clk_id {
>   	RPI_FIRMWARE_NUM_CLK_ID,
>   };
>   
> +/**
> + * struct rpi_firmware_clk_rate_request - Firmware Request for a rate
> + * @id:	ID of the clock being queried
> + * @rate: Rate in Hertz. Set by the firmware.
> + *
> + * Used by @RPI_FIRMWARE_GET_CLOCK_RATE, @RPI_FIRMWARE_GET_CLOCK_MEASURED,
> + * @RPI_FIRMWARE_GET_MAX_CLOCK_RATE and @RPI_FIRMWARE_GET_MIN_CLOCK_RATE.
> + */
> +struct rpi_firmware_clk_rate_request {
> +	__le32 id;
> +	__le32 rate;
> +} __packed;
> +
> +#define RPI_FIRMWARE_CLK_RATE_REQUEST(_id)	\
> +	{					\
> +		.id = _id,			\
> +	}
> +
>   #if IS_ENABLED(CONFIG_RASPBERRYPI_FIRMWARE)
>   int rpi_firmware_property(struct rpi_firmware *fw,
>   			  u32 tag, void *data, size_t len);
>   int rpi_firmware_property_list(struct rpi_firmware *fw,
>   			       void *data, size_t tag_size);
>   void rpi_firmware_put(struct rpi_firmware *fw);
> +unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw,
> +					   unsigned int id);
>   struct device_node *rpi_firmware_find_node(void);
>   struct rpi_firmware *rpi_firmware_get(struct device_node *firmware_node);
>   struct rpi_firmware *devm_rpi_firmware_get(struct device *dev,
> @@ -179,6 +199,12 @@ static inline int rpi_firmware_property_list(struct rpi_firmware *fw,
>   
>   static inline void rpi_firmware_put(struct rpi_firmware *fw) { }
>   
> +static inline unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw,
> +							 unsigned int id)
> +{
> +	return UINT_MAX;
In case the driver is disabled the function return UINT_MAX, but in case 
the firmware doesn't support RPI_FIRMWARE_GET_MAX_CLOCK_RATE it returns 
0. This looks a little bit inconsistent to me.
> +}
> +
>   static inline struct device_node *rpi_firmware_find_node(void)
>   {
>   	return NULL;
>
