Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80BD36F9220
	for <lists+linux-clk@lfdr.de>; Sat,  6 May 2023 14:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232456AbjEFMmh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 6 May 2023 08:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232203AbjEFMmg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 6 May 2023 08:42:36 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899171FD2
        for <linux-clk@vger.kernel.org>; Sat,  6 May 2023 05:42:32 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f19a7f9424so28296445e9.2
        for <linux-clk@vger.kernel.org>; Sat, 06 May 2023 05:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1683376951; x=1685968951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ETgLzuZWXDBo2DHuWZo+FP0Rii2eMT28R1ZVGASO7IE=;
        b=f+MlINBUUQTtKqlEMgrIDKKzW2Xy5k96vPeNcj0TDariCtHMJjD3OYxKxS9sybVNXF
         7xSlVc7lfvBH5dIUnk8X/H5n4EB0YwKXdP65ElwXC6nIFkQ6YJeYI8Oc+Xs2e5O5feMc
         OvWfTgnENZEWqo+6an8tCNyjldAYub+MW8pbw3dqgxMU0auoHxwxG1zT62B61TywQ+73
         vlarRD7RY0R5nDxMBvY5Is6mD53cbPZQHTu5yKoC4mJI46A/x7Q0/l9kzkudpgFc+Hyu
         tCzKwncOP53nYZspJT2ItCcL6MDcCwHV6VelRyJbHRP05E0UHy6jbfPONktWS36AXf1q
         SbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683376951; x=1685968951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETgLzuZWXDBo2DHuWZo+FP0Rii2eMT28R1ZVGASO7IE=;
        b=WDxnZ2krjpMJVHziBg9nam870COdRjFjDZpyFdZ0UP/0wX8c5za1movBJNqMu5ezs5
         wm8ZA8jC2svOQWEw+irOGcgseP8/0OQx9i4cPIjnCjXleTDmUkFWP3uEk/nHzZAdvoU9
         9Fezz8rrdwt9k28hVplpHs8RQlMQUnWhAEIUwbe6+Wq9O15PHv2McKnakyEVD2/eaqQZ
         M1fJ//oYRY7MSMIVpxg2CxftT3OFKl7gTdtORK9ejka4gQbQNkN+zJ6XNwQ7dIot/xPv
         OSAFuzJa85LXNUDn73hV70wR3O9r6k60xxuUTzhiCK5ufKYEj90uZLSji0Ec7rEp2SIb
         YbfA==
X-Gm-Message-State: AC+VfDxXUr7sinRv0njKh6mfkzhElg4p7WlT9hBuzfN4rszBxAPNAZ9g
        iwMAu0EqHx66lCXYyJk/5FVOcw==
X-Google-Smtp-Source: ACHHUZ4DB9W/qlrG1KUfME6RoG3W96oQFkowVAagb0oJbEjxqWQLEx10AfUVgGn0tXZQJ2RU89qa2w==
X-Received: by 2002:a05:600c:2055:b0:3f1:806a:83d5 with SMTP id p21-20020a05600c205500b003f1806a83d5mr3116458wmg.20.1683376950783;
        Sat, 06 May 2023 05:42:30 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id z24-20020a1cf418000000b003f3e50eb606sm10657841wma.13.2023.05.06.05.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 05:42:29 -0700 (PDT)
Date:   Sat, 6 May 2023 14:42:28 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc:     Vadim Fedorenko <vadfed@meta.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH v7 6/8] ptp_ocp: implement DPLL ops
Message-ID: <ZFZLNLE567nhS6xs@nanopsycho>
References: <20230428002009.2948020-1-vadfed@meta.com>
 <20230428002009.2948020-7-vadfed@meta.com>
 <ZFN6lwE2Up8xV+I6@nanopsycho>
 <11b00a89-0882-8583-d624-63d0d0b29c85@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11b00a89-0882-8583-d624-63d0d0b29c85@linux.dev>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, May 05, 2023 at 03:43:08PM CEST, vadim.fedorenko@linux.dev wrote:
>On 04/05/2023 10:27, Jiri Pirko wrote:
>> Fri, Apr 28, 2023 at 02:20:07AM CEST, vadfed@meta.com wrote:
>> > From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>> > 
>> > Implement basic DPLL operations in ptp_ocp driver as the
>> > simplest example of using new subsystem.
>> > 
>> > Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>> > ---
>> > drivers/ptp/Kconfig   |   1 +
>> > drivers/ptp/ptp_ocp.c | 327 +++++++++++++++++++++++++++++++++++-------
>> > 2 files changed, 276 insertions(+), 52 deletions(-)
>> > 
>> > diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
>> > index b00201d81313..e3575c2e34dc 100644
>> > --- a/drivers/ptp/Kconfig
>> > +++ b/drivers/ptp/Kconfig
>> > @@ -177,6 +177,7 @@ config PTP_1588_CLOCK_OCP
>> > 	depends on COMMON_CLK
>> > 	select NET_DEVLINK
>> > 	select CRC16
>> > +	select DPLL
>> > 	help
>> > 	  This driver adds support for an OpenCompute time card.
>> > 
>> > diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
>> > index 2b63f3487645..100e5da0aeb3 100644
>> > --- a/drivers/ptp/ptp_ocp.c
>> > +++ b/drivers/ptp/ptp_ocp.c
>> > @@ -23,6 +23,7 @@
>> > #include <linux/mtd/mtd.h>
>> > #include <linux/nvmem-consumer.h>
>> > #include <linux/crc16.h>
>> > +#include <linux/dpll.h>
>> > 
>> > #define PCI_VENDOR_ID_FACEBOOK			0x1d9b
>> > #define PCI_DEVICE_ID_FACEBOOK_TIMECARD		0x0400
>> > @@ -261,12 +262,21 @@ enum ptp_ocp_sma_mode {
>> > 	SMA_MODE_OUT,
>> > };
>> > 
>> > +static struct dpll_pin_frequency ptp_ocp_sma_freq[] = {
>> 
>> const
>
>Forgot about this one, will change it.
>
>> 
>> > +	DPLL_PIN_FREQUENCY_1PPS,
>> > +	DPLL_PIN_FREQUENCY_10MHZ,
>> > +	DPLL_PIN_FREQUENCY_IRIG_B,
>> > +	DPLL_PIN_FREQUENCY_DCF77,
>> > +};
>> > +
>> > struct ptp_ocp_sma_connector {
>> > 	enum	ptp_ocp_sma_mode mode;
>> > 	bool	fixed_fcn;
>> > 	bool	fixed_dir;
>> > 	bool	disabled;
>> > 	u8	default_fcn;
>> > +	struct dpll_pin		   *dpll_pin;
>> > +	struct dpll_pin_properties dpll_prop;
>> > };
>> > 
>> > struct ocp_attr_group {
>> > @@ -295,6 +305,7 @@ struct ptp_ocp_serial_port {
>> > 
>> > #define OCP_BOARD_ID_LEN		13
>> > #define OCP_SERIAL_LEN			6
>> > +#define OCP_SMA_NUM			4
>> > 
>> > struct ptp_ocp {
>> > 	struct pci_dev		*pdev;
>> > @@ -351,8 +362,9 @@ struct ptp_ocp {
>> > 	u32			ts_window_adjust;
>> > 	u64			fw_cap;
>> > 	struct ptp_ocp_signal	signal[4];
>> > -	struct ptp_ocp_sma_connector sma[4];
>> > +	struct ptp_ocp_sma_connector sma[OCP_SMA_NUM];
>> > 	const struct ocp_sma_op *sma_op;
>> > +	struct dpll_device *dpll;
>> > };
>> > 
>> > #define OCP_REQ_TIMESTAMP	BIT(0)
>> > @@ -836,6 +848,7 @@ static DEFINE_IDR(ptp_ocp_idr);
>> > struct ocp_selector {
>> > 	const char *name;
>> > 	int value;
>> > +	u64 frequency;
>> > };
>> > 
>> > static const struct ocp_selector ptp_ocp_clock[] = {
>> > @@ -856,31 +869,31 @@ static const struct ocp_selector ptp_ocp_clock[] = {
>> > #define SMA_SELECT_MASK		GENMASK(14, 0)
>> > 
>> > static const struct ocp_selector ptp_ocp_sma_in[] = {
>> > -	{ .name = "10Mhz",	.value = 0x0000 },
>> > -	{ .name = "PPS1",	.value = 0x0001 },
>> > -	{ .name = "PPS2",	.value = 0x0002 },
>> > -	{ .name = "TS1",	.value = 0x0004 },
>> > -	{ .name = "TS2",	.value = 0x0008 },
>> > -	{ .name = "IRIG",	.value = 0x0010 },
>> > -	{ .name = "DCF",	.value = 0x0020 },
>> > -	{ .name = "TS3",	.value = 0x0040 },
>> > -	{ .name = "TS4",	.value = 0x0080 },
>> > -	{ .name = "FREQ1",	.value = 0x0100 },
>> > -	{ .name = "FREQ2",	.value = 0x0200 },
>> > -	{ .name = "FREQ3",	.value = 0x0400 },
>> > -	{ .name = "FREQ4",	.value = 0x0800 },
>> > -	{ .name = "None",	.value = SMA_DISABLE },
>> > +	{ .name = "10Mhz",  .value = 0x0000,      .frequency = 10000000 },
>> > +	{ .name = "PPS1",   .value = 0x0001,      .frequency = 1 },
>> > +	{ .name = "PPS2",   .value = 0x0002,      .frequency = 1 },
>> > +	{ .name = "TS1",    .value = 0x0004,      .frequency = 0 },
>> > +	{ .name = "TS2",    .value = 0x0008,      .frequency = 0 },
>> > +	{ .name = "IRIG",   .value = 0x0010,      .frequency = 10000 },
>> > +	{ .name = "DCF",    .value = 0x0020,      .frequency = 77500 },
>> > +	{ .name = "TS3",    .value = 0x0040,      .frequency = 0 },
>> > +	{ .name = "TS4",    .value = 0x0080,      .frequency = 0 },
>> > +	{ .name = "FREQ1",  .value = 0x0100,      .frequency = 0 },
>> > +	{ .name = "FREQ2",  .value = 0x0200,      .frequency = 0 },
>> > +	{ .name = "FREQ3",  .value = 0x0400,      .frequency = 0 },
>> > +	{ .name = "FREQ4",  .value = 0x0800,      .frequency = 0 },
>> > +	{ .name = "None",   .value = SMA_DISABLE, .frequency = 0 },
>> > 	{ }
>> > };
>> > 
>> > static const struct ocp_selector ptp_ocp_sma_out[] = {
>> > -	{ .name = "10Mhz",	.value = 0x0000 },
>> > -	{ .name = "PHC",	.value = 0x0001 },
>> > -	{ .name = "MAC",	.value = 0x0002 },
>> > -	{ .name = "GNSS1",	.value = 0x0004 },
>> > -	{ .name = "GNSS2",	.value = 0x0008 },
>> > -	{ .name = "IRIG",	.value = 0x0010 },
>> > -	{ .name = "DCF",	.value = 0x0020 },
>> > +	{ .name = "10Mhz",	.value = 0x0000,  .frequency = 10000000 },
>> > +	{ .name = "PHC",	.value = 0x0001,  .frequency = 1 },
>> > +	{ .name = "MAC",	.value = 0x0002,  .frequency = 1 },
>> > +	{ .name = "GNSS1",	.value = 0x0004,  .frequency = 1 },
>> > +	{ .name = "GNSS2",	.value = 0x0008,  .frequency = 1 },
>> > +	{ .name = "IRIG",	.value = 0x0010,  .frequency = 10000 },
>> > +	{ .name = "DCF",	.value = 0x0020,  .frequency = 77000 },
>> > 	{ .name = "GEN1",	.value = 0x0040 },
>> > 	{ .name = "GEN2",	.value = 0x0080 },
>> > 	{ .name = "GEN3",	.value = 0x0100 },
>> > @@ -891,15 +904,15 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
>> > };
>> > 
>> > static const struct ocp_selector ptp_ocp_art_sma_in[] = {
>> > -	{ .name = "PPS1",	.value = 0x0001 },
>> > -	{ .name = "10Mhz",	.value = 0x0008 },
>> > +	{ .name = "PPS1",	.value = 0x0001,  .frequency = 1 },
>> > +	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 1000000 },
>> > 	{ }
>> > };
>> > 
>> > static const struct ocp_selector ptp_ocp_art_sma_out[] = {
>> > -	{ .name = "PHC",	.value = 0x0002 },
>> > -	{ .name = "GNSS",	.value = 0x0004 },
>> > -	{ .name = "10Mhz",	.value = 0x0010 },
>> > +	{ .name = "PHC",	.value = 0x0002,  .frequency = 1 },
>> > +	{ .name = "GNSS",	.value = 0x0004,  .frequency = 1 },
>> > +	{ .name = "10Mhz",	.value = 0x0010,  .frequency = 10000000 },
>> > 	{ }
>> > };
>> > 
>> > @@ -2283,22 +2296,34 @@ ptp_ocp_sma_fb_set_inputs(struct ptp_ocp *bp, int sma_nr, u32 val)
>> > static void
>> > ptp_ocp_sma_fb_init(struct ptp_ocp *bp)
>> > {
>> > +	struct dpll_pin_properties prop = {
>> 
>> Why don't you have this as static const outside the function?
>> 
>
>Because I'm changing label string for every pin. I cannot change it in
>the const object.

No you don't. You just copy prop to bp->sma[i].dpll_prop. Prop does not
change.


>
>> 
>> > +		.label = NULL,
>> 
>> Pointless init.
>
>Agree
>
>> > +		.type = DPLL_PIN_TYPE_EXT,
>> > +		.capabilities = DPLL_PIN_CAPS_DIRECTION_CAN_CHANGE,
>> > +		.freq_supported_num = ARRAY_SIZE(ptp_ocp_sma_freq),
>> > +		.freq_supported = ptp_ocp_sma_freq,
>> > +
>> > +	};
>> > 	u32 reg;
>> > 	int i;
>> > 
>> > 	/* defaults */
>> > +	for (i = 0; i < OCP_SMA_NUM; i++) {
>> > +		bp->sma[i].default_fcn = i & 1;
>> > +		bp->sma[i].dpll_prop = prop;
>> > +		bp->sma[i].dpll_prop.label = bp->ptp_info.pin_config[i].name;
>> > +	}
>> > 	bp->sma[0].mode = SMA_MODE_IN;
>> > 	bp->sma[1].mode = SMA_MODE_IN;
>> > 	bp->sma[2].mode = SMA_MODE_OUT;
>> > 	bp->sma[3].mode = SMA_MODE_OUT;
>> > -	for (i = 0; i < 4; i++)
>> > -		bp->sma[i].default_fcn = i & 1;
>> > -
>> > 	/* If no SMA1 map, the pin functions and directions are fixed. */
>> > 	if (!bp->sma_map1) {
>> > -		for (i = 0; i < 4; i++) {
>> > +		for (i = 0; i < OCP_SMA_NUM; i++) {
>> > 			bp->sma[i].fixed_fcn = true;
>> > 			bp->sma[i].fixed_dir = true;
>> > +			bp->sma[1].dpll_prop.capabilities &=
>> > +				~DPLL_PIN_CAPS_DIRECTION_CAN_CHANGE;
>> > 		}
>> > 		return;
>> > 	}
>> > @@ -2308,7 +2333,7 @@ ptp_ocp_sma_fb_init(struct ptp_ocp *bp)
>> > 	 */
>> > 	reg = ioread32(&bp->sma_map2->gpio2);
>> > 	if (reg == 0xffffffff) {
>> > -		for (i = 0; i < 4; i++)
>> > +		for (i = 0; i < OCP_SMA_NUM; i++)
>> > 			bp->sma[i].fixed_dir = true;
>> > 	} else {
>> > 		reg = ioread32(&bp->sma_map1->gpio1);
>> > @@ -2330,7 +2355,7 @@ static const struct ocp_sma_op ocp_fb_sma_op = {
>> > };
>> > 
>> > static int
>> > -ptp_ocp_fb_set_pins(struct ptp_ocp *bp)
>> > +ptp_ocp_set_pins(struct ptp_ocp *bp)
>> > {
>> > 	struct ptp_pin_desc *config;
>> > 	int i;
>> > @@ -2397,16 +2422,16 @@ ptp_ocp_fb_board_init(struct ptp_ocp *bp, struct ocp_resource *r)
>> > 
>> > 	ptp_ocp_tod_init(bp);
>> > 	ptp_ocp_nmea_out_init(bp);
>> > -	ptp_ocp_sma_init(bp);
>> > 	ptp_ocp_signal_init(bp);
>> > 
>> > 	err = ptp_ocp_attr_group_add(bp, fb_timecard_groups);
>> > 	if (err)
>> > 		return err;
>> > 
>> > -	err = ptp_ocp_fb_set_pins(bp);
>> > +	err = ptp_ocp_set_pins(bp);
>> > 	if (err)
>> > 		return err;
>> > +	ptp_ocp_sma_init(bp);
>> > 
>> > 	return ptp_ocp_init_clock(bp);
>> > }
>> > @@ -2446,6 +2471,14 @@ ptp_ocp_register_resources(struct ptp_ocp *bp, kernel_ulong_t driver_data)
>> > static void
>> > ptp_ocp_art_sma_init(struct ptp_ocp *bp)
>> > {
>> > +	struct dpll_pin_properties prop = {
>> > +		.label = NULL,
>> > +		.type = DPLL_PIN_TYPE_EXT,
>> > +		.capabilities = 0,
>> 
>> Same comment as to the similar prop struct above. Plus another pointless
>> init here.
>> 
>
>Will remove pointless init.
>
>> 
>> > +		.freq_supported_num = ARRAY_SIZE(ptp_ocp_sma_freq),
>> > +		.freq_supported = ptp_ocp_sma_freq,
>> > +
>> > +	};
>> > 	u32 reg;
>> > 	int i;
>> > 
>> > @@ -2460,16 +2493,16 @@ ptp_ocp_art_sma_init(struct ptp_ocp *bp)
>> > 	bp->sma[2].default_fcn = 0x10;	/* OUT: 10Mhz */
>> > 	bp->sma[3].default_fcn = 0x02;	/* OUT: PHC */
>> > 
>> > -	/* If no SMA map, the pin functions and directions are fixed. */
>> > -	if (!bp->art_sma) {
>> > -		for (i = 0; i < 4; i++) {
>> > +
>> > +	for (i = 0; i < OCP_SMA_NUM; i++) {
>> > +		/* If no SMA map, the pin functions and directions are fixed. */
>> > +		bp->sma[i].dpll_prop = prop;
>> > +		bp->sma[i].dpll_prop.label = bp->ptp_info.pin_config[i].name;
>> > +		if (!bp->art_sma) {
>> > 			bp->sma[i].fixed_fcn = true;
>> > 			bp->sma[i].fixed_dir = true;
>> > +			continue;
>> > 		}
>> > -		return;
>> > -	}
>> > -
>> > -	for (i = 0; i < 4; i++) {
>> > 		reg = ioread32(&bp->art_sma->map[i].gpio);
>> > 
>> > 		switch (reg & 0xff) {
>> > @@ -2480,9 +2513,13 @@ ptp_ocp_art_sma_init(struct ptp_ocp *bp)
>> > 		case 1:
>> > 		case 8:
>> > 			bp->sma[i].mode = SMA_MODE_IN;
>> > +			bp->sma[i].dpll_prop.capabilities =
>> > +				DPLL_PIN_CAPS_DIRECTION_CAN_CHANGE;
>> > 			break;
>> > 		default:
>> > 			bp->sma[i].mode = SMA_MODE_OUT;
>> > +			bp->sma[i].dpll_prop.capabilities =
>> > +				DPLL_PIN_CAPS_DIRECTION_CAN_CHANGE;
>> > 			break;
>> > 		}
>> > 	}
>> > @@ -2549,6 +2586,9 @@ ptp_ocp_art_board_init(struct ptp_ocp *bp, struct ocp_resource *r)
>> > 	/* Enable MAC serial port during initialisation */
>> > 	iowrite32(1, &bp->board_config->mro50_serial_activate);
>> > 
>> > +	err = ptp_ocp_set_pins(bp);
>> > +	if (err)
>> > +		return err;
>> > 	ptp_ocp_sma_init(bp);
>> > 
>> > 	err = ptp_ocp_attr_group_add(bp, art_timecard_groups);
>> > @@ -2690,16 +2730,9 @@ sma4_show(struct device *dev, struct device_attribute *attr, char *buf)
>> > }
>> > 
>> > static int
>> > -ptp_ocp_sma_store(struct ptp_ocp *bp, const char *buf, int sma_nr)
>> > +ptp_ocp_sma_store_val(struct ptp_ocp *bp, int val, enum ptp_ocp_sma_mode mode, int sma_nr)
>> > {
>> > 	struct ptp_ocp_sma_connector *sma = &bp->sma[sma_nr - 1];
>> > -	enum ptp_ocp_sma_mode mode;
>> > -	int val;
>> > -
>> > -	mode = sma->mode;
>> > -	val = sma_parse_inputs(bp->sma_op->tbl, buf, &mode);
>> > -	if (val < 0)
>> > -		return val;
>> > 
>> > 	if (sma->fixed_dir && (mode != sma->mode || val & SMA_DISABLE))
>> > 		return -EOPNOTSUPP;
>> > @@ -2734,6 +2767,20 @@ ptp_ocp_sma_store(struct ptp_ocp *bp, const char *buf, int sma_nr)
>> > 	return val;
>> > }
>> > 
>> > +static int
>> > +ptp_ocp_sma_store(struct ptp_ocp *bp, const char *buf, int sma_nr)
>> > +{
>> > +	struct ptp_ocp_sma_connector *sma = &bp->sma[sma_nr - 1];
>> > +	enum ptp_ocp_sma_mode mode;
>> > +	int val;
>> > +
>> > +	mode = sma->mode;
>> > +	val = sma_parse_inputs(bp->sma_op->tbl, buf, &mode);
>> > +	if (val < 0)
>> > +		return val;
>> > +	return ptp_ocp_sma_store_val(bp, val, mode, sma_nr);
>> > +}
>> > +
>> > static ssize_t
>> > sma1_store(struct device *dev, struct device_attribute *attr,
>> > 	   const char *buf, size_t count)
>> > @@ -4172,12 +4219,148 @@ ptp_ocp_detach(struct ptp_ocp *bp)
>> > 	device_unregister(&bp->dev);
>> > }
>> > 
>> > +static int ptp_ocp_dpll_lock_status_get(const struct dpll_device *dpll,
>> > +					void *priv,
>> > +					enum dpll_lock_status *status,
>> > +					struct netlink_ext_ack *extack)
>> > +{
>> > +	struct ptp_ocp *bp = priv;
>> > +	int sync;
>> > +
>> > +	sync = ioread32(&bp->reg->status) & OCP_STATUS_IN_SYNC;
>> > +	*status = sync ? DPLL_LOCK_STATUS_LOCKED : DPLL_LOCK_STATUS_UNLOCKED;
>> 
>> Does your device support event delivery in case of the status change?
>> ice and mlx5 drivers do poll for changes in this area anyway. It's a
>> part of this patchset. You should do the same if your device does
>> not support events.
>> 
>> Could you please implement notifications using
>> dpll_device_notify() for status change and dpll_pin_notify() for pin
>> state change?
>> 
>
>We are working on implementation of interrupt-based notifications, that's why
>I didn't implement polling code. Hopefully it will be ready before the
>non-RFC patchset submission.

Do polling implementation if not and replace by interrupt driver later.
Point is, there have to be notifications from day 1.


>
>> 
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +static int ptp_ocp_dpll_source_idx_get(const struct dpll_device *dpll,
>> > +				       void *priv, u32 *idx,
>> > +				       struct netlink_ext_ack *extack)
>> > +{
>> > +	struct ptp_ocp *bp = priv;
>> > +
>> > +	if (bp->pps_select) {
>> > +		*idx = ioread32(&bp->pps_select->gpio1);
>> > +		return 0;
>> > +	}
>> > +	return -EINVAL;
>> > +}
>> > +
>> > +static int ptp_ocp_dpll_mode_get(const struct dpll_device *dpll, void *priv,
>> > +				 u32 *mode, struct netlink_ext_ack *extack)
>> > +{
>> > +	*mode = DPLL_MODE_AUTOMATIC;
>> > +	return 0;
>> > +}
>> > +
>> > +static bool ptp_ocp_dpll_mode_supported(const struct dpll_device *dpll,
>> > +					void *priv, const enum dpll_mode mode,
>> > +					struct netlink_ext_ack *extack)
>> > +{
>> > +	return mode == DPLL_MODE_AUTOMATIC;
>> > +}
>> > +
>> > +static int ptp_ocp_dpll_direction_get(const struct dpll_pin *pin,
>> > +				      void *pin_priv,
>> > +				      const struct dpll_device *dpll,
>> > +				      void *priv,
>> > +				      enum dpll_pin_direction *direction,
>> > +				      struct netlink_ext_ack *extack)
>> > +{
>> > +	struct ptp_ocp_sma_connector *sma = pin_priv;
>> > +
>> > +	*direction = sma->mode == SMA_MODE_IN ?
>> > +				  DPLL_PIN_DIRECTION_SOURCE :
>> > +				  DPLL_PIN_DIRECTION_OUTPUT;
>> > +	return 0;
>> > +}
>> > +
>> > +static int ptp_ocp_dpll_direction_set(const struct dpll_pin *pin,
>> > +				      void *pin_priv,
>> > +				      const struct dpll_device *dpll,
>> > +				      void *dpll_priv,
>> > +				      enum dpll_pin_direction direction,
>> > +				      struct netlink_ext_ack *extack)
>> > +{
>> > +	struct ptp_ocp_sma_connector *sma = pin_priv;
>> > +	struct ptp_ocp *bp = dpll_priv;
>> > +	enum ptp_ocp_sma_mode mode;
>> > +	int sma_nr = (sma - bp->sma);
>> > +
>> > +	if (sma->fixed_dir)
>> 
>> I believe that this is a pointless check as DPLL_PIN_CAPS_DIRECTION_CAN_CHANGE
>> is not set and therefore the check in dpll_pin_direction_set() will be
>> true and -EOPNOTSUPP will be returned from there.
>> Remove this.
>
>Yep, will do it.
>
>> 
>> > +		return -EOPNOTSUPP;
>> > +	mode = direction == DPLL_PIN_DIRECTION_SOURCE ?
>> > +			    SMA_MODE_IN : SMA_MODE_OUT;
>> > +	return ptp_ocp_sma_store_val(bp, 0, mode, sma_nr);
>> 
>> You need sma_nr just here. Why can't you change ptp_ocp_sma_store_val()
>> to accept struct ptp_ocp_sma_connector * instead avoiding the need for
>> tne sma_nr completely?
>> 
>
>I wanted to add minimal changes to the driver, I will consider changing this
>as a separate net-next patch.

Hmm, you do change ptp_ocp_sma_store_val() here anyway. Could be an
extra patch in this patchset before this one if you want to have it
separate.


>
>> 
>> > +}
>> > +
>> > +static int ptp_ocp_dpll_frequency_set(const struct dpll_pin *pin,
>> > +				      void *pin_priv,
>> > +				      const struct dpll_device *dpll,
>> > +				      void *dpll_priv, u64 frequency,
>> > +				      struct netlink_ext_ack *extack)
>> > +{
>> > +	struct ptp_ocp_sma_connector *sma = pin_priv;
>> > +	struct ptp_ocp *bp = dpll_priv;
>> > +	const struct ocp_selector *tbl;
>> > +	int sma_nr = (sma - bp->sma);
>> > +	int val, i;
>> > +
>> > +	if (sma->fixed_fcn)
>> 
>> In that case, just fill up a single frequency in the properties,
>> avoid this check-fail and let the dpll core handle it.
>> 
>
>Makes sense.
>
>> 
>> > +		return -EOPNOTSUPP;
>> > +
>> > +	tbl = bp->sma_op->tbl[sma->mode];
>> > +	for (i = 0; tbl[i].name; i++)
>> > +		if (tbl[i].frequency == frequency)
>> > +			return ptp_ocp_sma_store_val(bp, val, sma->mode, sma_nr);
>> > +	return -EINVAL;
>> > +}
>> > +
>> > +static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
>> > +				      void *pin_priv,
>> > +				      const struct dpll_device *dpll,
>> > +				      void *dpll_priv, u64 *frequency,
>> > +				      struct netlink_ext_ack *extack)
>> > +{
>> > +	struct ptp_ocp_sma_connector *sma = pin_priv;
>> > +	struct ptp_ocp *bp = dpll_priv;
>> > +	const struct ocp_selector *tbl;
>> > +	int sma_nr = (sma - bp->sma);
>> 
>> 1) void "()"s here.
>> 2) why don't you fill the sma_nr in struct ptp_ocp_sma_connector to make
>>     this easier to follow? IDK, just a suggestion, take or leave.
>> 
>> Same applies to the the rest of similar occurances above.
>> 
>
>Will do it, yes.
>
>> 
>> > +	u32 val;
>> > +	int i;
>> > +
>> > +	val = bp->sma_op->get(bp, sma_nr);
>> > +	tbl = bp->sma_op->tbl[sma->mode];
>> > +	for (i = 0; tbl[i].name; i++)
>> > +		if (val == tbl[i].value) {
>> > +			*frequency = tbl[i].frequency;
>> > +			return 0;
>> > +		}
>> > +
>> > +	return -EINVAL;
>> > +}
>> > +
>> > +static const struct dpll_device_ops dpll_ops = {
>> > +	.lock_status_get = ptp_ocp_dpll_lock_status_get,
>> > +	.source_pin_idx_get = ptp_ocp_dpll_source_idx_get,
>> 
>> This op is a leftover, in dpll core it is not called. This was removed
>> and agreed that drivers should implement state_on_dpll_get() op for pins
>> to see which one is connected.
>> 
>> Please fix here and remove the leftover from DPLL patch #2 as well.

Did you miss this by any chance?


>> 
>> 
>> > +	.mode_get = ptp_ocp_dpll_mode_get,
>> > +	.mode_supported = ptp_ocp_dpll_mode_supported,
>> > +};
>> > +
>> > +static const struct dpll_pin_ops dpll_pins_ops = {
>> > +	.frequency_get = ptp_ocp_dpll_frequency_get,
>> > +	.frequency_set = ptp_ocp_dpll_frequency_set,
>> > +	.direction_get = ptp_ocp_dpll_direction_get,
>> > +	.direction_set = ptp_ocp_dpll_direction_set,
>> > +};
>> > +
>> > static int
>> > ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>> > {
>> > 	struct devlink *devlink;
>> > 	struct ptp_ocp *bp;
>> > -	int err;
>> > +	int err, i;
>> > +	u64 clkid;
>> > 
>> > 	devlink = devlink_alloc(&ptp_ocp_devlink_ops, sizeof(*bp), &pdev->dev);
>> > 	if (!devlink) {
>> > @@ -4227,8 +4410,39 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>> > 
>> > 	ptp_ocp_info(bp);
>> > 	devlink_register(devlink);
>> > -	return 0;
>> > 
>> > +	clkid = pci_get_dsn(pdev);
>> > +	bp->dpll = dpll_device_get(clkid, 0, THIS_MODULE);
>> 
>> I suggested this the last time, but again: Could you please:
>> 1) rename dpll_device_get to __dpll_device_get
>> 2) introduce dpll_device_get as a macro filling up THIS_MODULE
>> 
>> Then drivers will just call always:
>> bp->dpll = dpll_device_get(clkid, 0);
>> and the macro will fillup the module automatically.
>> 
>> Please do the same for dpll_pin_get()
>> 
>
>Not sure why I have missed this part, but sure will do it.

Awesome.


>
>> 
>> > +	if (IS_ERR(bp->dpll)) {
>> > +		dev_err(&pdev->dev, "dpll_device_alloc failed\n");
>> 
>> You need to fix your error path to call devlink_unregister() in this
>> case.
>> 
>> 
>> > +		goto out;
>> > +	}
>> > +
>> > +	err = dpll_device_register(bp->dpll, DPLL_TYPE_PPS, &dpll_ops, bp, &pdev->dev);
>> > +	if (err)
>> 
>> You need to fix your error path to call dpll_device_put() in this
>> case.
>> 
>
>Ok, I'll re-check and update the error path for the next version.
>
>> 
>> > +		goto out;
>> > +
>> > +	for (i = 0; i < OCP_SMA_NUM; i++) {
>> > +		bp->sma[i].dpll_pin = dpll_pin_get(clkid, i, THIS_MODULE, &bp->sma[i].dpll_prop);
>> > +		if (IS_ERR(bp->sma[i].dpll_pin))
>> > +			goto out_dpll;
>> > +
>> > +		err = dpll_pin_register(bp->dpll, bp->sma[i].dpll_pin, &dpll_pins_ops,
>> > +					&bp->sma[i], NULL);
>> > +		if (err) {
>> > +			dpll_pin_put(bp->sma[i].dpll_pin);
>> > +			goto out_dpll;
>> > +		}
>> > +	}
>> > +
>> > +	return 0;
>> > +out_dpll:
>> > +	while (i) {
>> > +		--i;
>> 
>> 	while (i--) {
>> 	?
>> 
>> > +		dpll_pin_unregister(bp->dpll, bp->sma[i].dpll_pin, &dpll_pins_ops, &bp->sma[i]);
>> > +		dpll_pin_put(bp->sma[i].dpll_pin);
>> > +	}
>> > +	dpll_device_put(bp->dpll);
>> > out:
>> > 	ptp_ocp_detach(bp);
>> > out_disable:
>> > @@ -4243,7 +4457,16 @@ ptp_ocp_remove(struct pci_dev *pdev)
>> > {
>> > 	struct ptp_ocp *bp = pci_get_drvdata(pdev);
>> > 	struct devlink *devlink = priv_to_devlink(bp);
>> > +	int i;
>> > 
>> > +	for (i = 0; i < OCP_SMA_NUM; i++) {
>> > +		if (bp->sma[i].dpll_pin) {
>> 
>> Remove this pointless check. It is always true.
>
>Agree.
>
>> 
>> 
>> > +			dpll_pin_unregister(bp->dpll, bp->sma[i].dpll_pin, &dpll_pins_ops, bp);
>> > +			dpll_pin_put(bp->sma[i].dpll_pin);
>> > +		}
>> > +	}
>> > +	dpll_device_unregister(bp->dpll, &dpll_ops, bp);
>> > +	dpll_device_put(bp->dpll);
>> > 	devlink_unregister(devlink);
>> > 	ptp_ocp_detach(bp);
>> > 	pci_disable_device(pdev);
>> > -- 
>> > 2.34.1
>> > 
>
