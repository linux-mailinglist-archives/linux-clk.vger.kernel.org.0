Return-Path: <linux-clk+bounces-703-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0E4800200
	for <lists+linux-clk@lfdr.de>; Fri,  1 Dec 2023 04:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73AE9B20E9A
	for <lists+linux-clk@lfdr.de>; Fri,  1 Dec 2023 03:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EEF17E1;
	Fri,  1 Dec 2023 03:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hynQmqnn"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BACFB12F;
	Thu, 30 Nov 2023 19:19:43 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-677fba00a49so14056486d6.1;
        Thu, 30 Nov 2023 19:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701400783; x=1702005583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:reply-to
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w1yLxxT5KsdGuu3GRJZZLxdc6kDna2jefgX1rczCN6k=;
        b=hynQmqnngQ/omXqhOrh+tw0YRVO1FPCCdTpCuxxEoqpLg5xQIemm74Vor4zYNnzWwQ
         qogfxY/v8DYPHK67YEUIY6cXlpXqo7aj9BMgidkAnZ3Ll7N+vdIm5noOYgvYj3y5H5D9
         gKofXIjnd3oSGRtH73zN3hRIPOaeQ4q0dVo22+6d/HXBFDgcuc5BTgJg5WIeGIPHMvum
         5Cxs35Yh0Lo4y/XIboVkAPIXjtWdK9qFVKtbLm7xPonYNhENcf1PpCGCJr3602lEqW/d
         mSrJPTvN8pgLj452SF9uJUEFIyfYdu3vlxzNKwC7iFWq2gYuQQGWSO1sOEupEhftXi6l
         nzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701400783; x=1702005583;
        h=content-transfer-encoding:in-reply-to:from:reply-to
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1yLxxT5KsdGuu3GRJZZLxdc6kDna2jefgX1rczCN6k=;
        b=VEk8r8gddqsa1e8vOiNT9lhHaMfh+3WUVg3VDeAr8SuexzkJZ9FL6uSvzbonqYfZYo
         bXiNqvg6VimjnzAKUtNQGYWtLKVPzXiRb8Mnscpp4Su1CLRgetz8sk09XExFHYHlDH9H
         OH/Mm1UJSzU1d11wxbNNVu+my48AfVVNvUn+fFoKKy3TomwQnUXerNH2EMQfYemUPYoc
         HMBN9eW2MBwH7u1xelVvtCC5Z1wpNg66YuSddvNCG40de4i5+PvD1KMoRicKJKgljj9u
         Bck4MZhFM6KL6kKe0pcDIUaxm9znarYs8ZC5PshEz7t2l6DTk5FSXujjUn4YSm0djIpr
         lkxg==
X-Gm-Message-State: AOJu0YwXkwJ7nh0SxAY1vBH9m+gPtbgd/VKTO75++5AZtQMcUAXQqqw1
	FeDT7DkHy3fTuWlxxcu7ekw=
X-Google-Smtp-Source: AGHT+IHOiqqxjUtKvmkmSLEgSgHdXq9FR9qvjq3PYWE8VyCQxJoW5+tku2zDkZ0kzRxFNhwAyV155g==
X-Received: by 2002:a0c:ecc4:0:b0:67a:9826:8ef6 with SMTP id o4-20020a0cecc4000000b0067a98268ef6mr1009241qvq.16.1701400782754;
        Thu, 30 Nov 2023 19:19:42 -0800 (PST)
Received: from [192.168.50.160] (174-080-102-187.res.spectrum.com. [174.80.102.187])
        by smtp.gmail.com with ESMTPSA id n17-20020a0cdc91000000b0067a4a0a7e6fsm1061714qvk.108.2023.11.30.19.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 19:19:42 -0800 (PST)
Message-ID: <f8ae78a0-f329-457a-8a53-b1725f9e2e20@gmail.com>
Date: Thu, 30 Nov 2023 21:19:40 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: macroalpha82@gmail.com
Cc: airlied@gmail.com, conor+dt@kernel.org, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, javierm@redhat.com, krzysztof.kozlowski+dt@linaro.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, macromorgan@hotmail.com,
 mripard@kernel.org, mturquette@baylibre.com, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, robh+dt@kernel.org, sam@ravnborg.org,
 sboyd@kernel.org, tzimmermann@suse.de
References: <20231130155624.405575-7-macroalpha82@gmail.com>
Subject: Re: [PATCH 6/9] drm/panel: himax-hx8394: Add Support for Powkiddy X55
 panel
Content-Language: en-US
Reply-To: 20231130155624.405575-7-macroalpha82@gmail.com
From: Kendrick Curry <notime2d8@gmail.com>
In-Reply-To: <20231130155624.405575-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, Nov 30, 2023 at 09:56:21AM -0600, Chris Morgan wrote:
 > From: Chris Morgan <macromorgan@hotmail.com>
 >
 > Add support for the Powkiddy X55 panel as used on the Powkiddy X55
 > handheld gaming console. This panel uses a Himax HX8394 display
 > controller and requires a vendor provided init sequence. The display
 > resolution is 720x1280 and is 67mm by 121mm as measured with calipers.
 >
 > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
 > ---
 >  drivers/gpu/drm/panel/panel-himax-hx8394.c | 137 +++++++++++++++++++++
 >  1 file changed, 137 insertions(+)
 >
 > diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c 
b/drivers/gpu/drm/panel/panel-himax-hx8394.c
 > index b68ea09f4725..4807ab1c10fe 100644
 > --- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
 > +++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
 > @@ -38,6 +38,7 @@
 >  #define HX8394_CMD_SETMIPI      0xba
 >  #define HX8394_CMD_SETOTP      0xbb
 >  #define HX8394_CMD_SETREGBANK      0xbd
 > +#define HX8394_CMD_UNKNOWN5      0xbf
 >  #define HX8394_CMD_UNKNOWN1      0xc0
 >  #define HX8394_CMD_SETDGCLUT      0xc1
 >  #define HX8394_CMD_SETID      0xc3
 > @@ -52,6 +53,7 @@
 >  #define HX8394_CMD_SETGIP1      0xd5
 >  #define HX8394_CMD_SETGIP2      0xd6
 >  #define HX8394_CMD_SETGPO      0xd6
 > +#define HX8394_CMD_UNKNOWN4      0xd8
 >  #define HX8394_CMD_SETSCALING      0xdd
 >  #define HX8394_CMD_SETIDLE      0xdf
 >  #define HX8394_CMD_SETGAMMA      0xe0
 > @@ -203,6 +205,140 @@ static const struct hx8394_panel_desc 
hsd060bhw4_desc = {
 >      .init_sequence = hsd060bhw4_init_sequence,
 >  };
 >
 > +static int powkiddy_x55_init_sequence(struct hx8394 *ctx)
 > +{
 > +    struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 > +
 > +    /* 5.19.8 SETEXTC: Set extension command (B9h) */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETEXTC,
 > +                   0xff, 0x83, 0x94);
 > +
 > +    /* 5.19.9 SETMIPI: Set MIPI control (BAh) */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETMIPI,
 > +                   0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
 > +
 > +    /* 5.19.2 SETPOWER: Set power (B1h) */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
 > +                   0x48, 0x12, 0x72, 0x09, 0x32, 0x54, 0x71, 0x71, 
0x57, 0x47);
 > +
 > +    /* 5.19.3 SETDISP: Set display related register (B2h) */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETDISP,
 > +                   0x00, 0x80, 0x64, 0x0c, 0x0d, 0x2f);
 > +
 > +    /* 5.19.4 SETCYC: Set display waveform cycles (B4h) */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETCYC,
 > +                   0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01, 0x0c, 
0x86, 0x75,
 > +                   0x00, 0x3f, 0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 
0x01, 0x0c,
 > +                   0x86);
 > +
 > +    /* 5.19.5 SETVCOM: Set VCOM voltage (B6h) */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETVCOM,
 > +                   0x6e, 0x6e);
 > +
 > +    /* 5.19.19 SETGIP0: Set GIP Option0 (D3h) */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP0,
 > +                   0x00, 0x00, 0x07, 0x07, 0x40, 0x07, 0x0c, 0x00, 
0x08, 0x10,
 > +                   0x08, 0x00, 0x08, 0x54, 0x15, 0x0a, 0x05, 0x0a, 
0x02, 0x15,
 > +                   0x06, 0x05, 0x06, 0x47, 0x44, 0x0a, 0x0a, 0x4b, 
0x10, 0x07,
 > +                   0x07, 0x0c, 0x40);
 > +
 > +    /* 5.19.20 Set GIP Option1 (D5h) */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP1,
 > +                   0x1c, 0x1c, 0x1d, 0x1d, 0x00, 0x01, 0x02, 0x03, 
0x04, 0x05,
 > +                   0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x24, 0x25, 
0x18, 0x18,
 > +                   0x26, 0x27, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 
0x18, 0x18,
 > +                   0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 
0x20, 0x21,
 > +                   0x18, 0x18, 0x18, 0x18);
 > +
 > +    /* 5.19.21 Set GIP Option2 (D6h) */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP2,
 > +                   0x1c, 0x1c, 0x1d, 0x1d, 0x07, 0x06, 0x05, 0x04, 
0x03, 0x02,
 > +                   0x01, 0x00, 0x0b, 0x0a, 0x09, 0x08, 0x21, 0x20, 
0x18, 0x18,
 > +                   0x27, 0x26, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 
0x18, 0x18,
 > +                   0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 
0x25, 0x24,
 > +                   0x18, 0x18, 0x18, 0x18);
 > +
 > +    /* 5.19.25 SETGAMMA: Set gamma curve related setting (E0h) */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGAMMA,
 > +                   0x00, 0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24, 0x22, 
0x47, 0x56,
 > +                   0x65, 0x66, 0x6e, 0x82, 0x88, 0x8b, 0x9a, 0x9d, 
0x98, 0xa8,
 > +                   0xb9, 0x5d, 0x5c, 0x61, 0x66, 0x6a, 0x6f, 0x7f, 
0x7f, 0x00,
 > +                   0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24, 0x22, 0x47, 
0x56, 0x65,
 > +                   0x65, 0x6e, 0x81, 0x87, 0x8b, 0x98, 0x9d, 0x99, 
0xa8, 0xba,
 > +                   0x5d, 0x5d, 0x62, 0x67, 0x6b, 0x72, 0x7f, 0x7f);
 > +
 > +    /* Unknown command, not listed in the HX8394-F datasheet */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN1,
 > +                   0x1f, 0x31);
 > +
 > +    /* 5.19.17 SETPANEL (CCh) */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPANEL,
 > +                   0x0b);
 > +
 > +    /* Unknown command, not listed in the HX8394-F datasheet */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN3,
 > +                   0x02);
 > +
 > +    /* 5.19.11 Set register bank (BDh) */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
 > +                   0x02);
 > +
 > +    /* Unknown command, not listed in the HX8394-F datasheet */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN4,
 > +                   0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 
0xff, 0xff,
 > +                   0xff, 0xff);
 > +
 > +    /* 5.19.11 Set register bank (BDh) */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
 > +                   0x00);
 > +
 > +    /* 5.19.11 Set register bank (BDh) */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
 > +                   0x01);
 > +
 > +    /* 5.19.2 SETPOWER: Set power (B1h) */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
 > +                   0x00);
 > +
 > +    /* 5.19.11 Set register bank (BDh) */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
 > +                   0x00);
 > +
 > +    /* Unknown command, not listed in the HX8394-F datasheet */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN5,
 > +                   0x40, 0x81, 0x50, 0x00, 0x1a, 0xfc, 0x01);
 > +
 > +    /* Unknown command, not listed in the HX8394-F datasheet */
 > +    mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN2,
 > +                   0xed);
 > +
 > +    return 0;
 > +}
 > +
 > +static const struct drm_display_mode powkiddy_x55_mode = {
 > +    .hdisplay    = 720,
 > +    .hsync_start    = 720 + 24,
 > +    .hsync_end    = 720 + 24 + 4,
 > +    .htotal        = 720 + 24 + 4 + 20,
 > +    .vdisplay    = 1280,
 > +    .vsync_start    = 1280 + 8,
 > +    .vsync_end    = 1280 + 8 + 4,
 > +    .vtotal        = 1280 + 8 + 4 + 8,
 > +    .clock        = 59904,
 > +    .flags        = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
 > +    .width_mm    = 67,
 > +    .height_mm    = 121,
 > +};
 > +
 > +static const struct hx8394_panel_desc powkiddy_x55_desc = {
 > +    .mode = &powkiddy_x55_mode,
 > +    .lanes = 4,
 > +    .mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |

 > +                     MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET,


It looks like a mode flag is set twice. The line above should be this below:

                          MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,


 > +    .format = MIPI_DSI_FMT_RGB888,
 > +    .init_sequence = powkiddy_x55_init_sequence,
 > +};
 > +
 >  static int hx8394_enable(struct drm_panel *panel)
 >  {
 >      struct hx8394 *ctx = panel_to_hx8394(panel);
 > @@ -419,6 +555,7 @@ static void hx8394_remove(struct mipi_dsi_device 
*dsi)
 >
 >  static const struct of_device_id hx8394_of_match[] = {
 >      { .compatible = "hannstar,hsd060bhw4", .data = &hsd060bhw4_desc },
 > +    { .compatible = "powkiddy,x55-panel", .data = &powkiddy_x55_desc },
 >      { /* sentinel */ }
 >  };
 >  MODULE_DEVICE_TABLE(of, hx8394_of_match);
 > --
 > 2.34.1
 >
 >
 > _______________________________________________
 > Linux-rockchip mailing list
 > Linux-rockchip@lists.infradead.org
 > http://lists.infradead.org/mailman/listinfo/linux-rockchip

