Return-Path: <linux-clk+bounces-24056-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB0EAF6C1B
	for <lists+linux-clk@lfdr.de>; Thu,  3 Jul 2025 09:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27B781899CAA
	for <lists+linux-clk@lfdr.de>; Thu,  3 Jul 2025 07:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D93E29CB4D;
	Thu,  3 Jul 2025 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1k9TzqiL"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93472BE63F
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 07:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529281; cv=none; b=nZHFeVojCiPqZbi7c4h177yPHBEbMP26fxbRJPp/fbuKnpvynl7YeuIzYA8Z+6l1Dc8ura6w8h1zWdVoaj9P9yjcbuo32EzjGSCJg9pSDZuv9iFmYzd7a4ttpcAReJNcv7YrPu2AW9hMeTEr3mtkZwk3PTfnSUauq1zFELw/w2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529281; c=relaxed/simple;
	bh=i/Tr33oBqASNVFfe599S1XtuxJI3ywlv04QSEz3vJH0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eRHpHuriU2e1tLBBCGBfbxuRLSKekp4RszUwZ6VeRE/dIxGjjJUF7LNX0zAJti4AaSAnQXxFmsKt5giiOkah9gMsLXuEq41/s2fpff5gNm28YgFhoOzVqNs/oQ5x/OxHIFao96Jqwf/+t3IBeXmHvmejZKixWNlzjJsQLS+7njE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1k9TzqiL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so46092605e9.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Jul 2025 00:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751529276; x=1752134076; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQ+a7e2XqmrAj6StBU7aKHlBb7NWBzERXFCwgZtjl3s=;
        b=1k9TzqiLci/lxZyu3xb3v/VnbC7KhG6SZCOwdjzk1wSUN8BgDj1UmTtvtWv4P0QIDo
         lgPfIq/U30pEjzR0CCeWVpKL+PiJMxGAkF8OZeKzwjIX6OBTHTHGjsg8/bmFS3bXVlJt
         Ky3aINQb1j6OQtHZRs6RWIMJ9ohB1dV15dvoG1Hw3M4jdks4GrXGNer/V3LmOrvtTD1q
         joPHjxGctVPGx6tnOHtkCFYdy0m3HsJo8mWo/mI6hHXEa/Xi7i2OrGEhrn1jIj2koeN+
         uq+h4U/W/d2oQiS1LS0v6i+BpRhQlydeAeXKgYlCXubj+JQvtSTSvnCZD2PHQ3C8qTCS
         Fs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751529276; x=1752134076;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQ+a7e2XqmrAj6StBU7aKHlBb7NWBzERXFCwgZtjl3s=;
        b=C1YhlgOZJ8HBci1hSSqTgSYe0AJzxD0ym/oD5y4mgHIe72jMAPA+tNsQYfYLyZEiiA
         /h1FESEYAZTB42spIeRZ7iLUXT6YmApsenFHWj++b3mQAE3jHczsGiVTHFBhke0nP2/P
         gL6O/4vlrTZ4GSBnsv9KQx2RlYyQl73Avdc9SdnblnJuosKipB7NIJf9iX2JjX5ynAfY
         jN23LKwpaT0PWUVLbCRnNYo3Bno9V6+jaYIeAhJ7yGBjwyoTByonCC/fZmPDyesEoKj8
         YmgUeK4o9YDNorUlQqmyD7H+LbUTsYE/VArPrTzVeaJaV4T0FyInAcyQk2ZLalk4Zdjo
         XSGg==
X-Forwarded-Encrypted: i=1; AJvYcCXRrCUXij7QMWEL1R9hVC/8wtPYtkECJn5eHEJ3ISyBN9fUSnZiPWcqpO/jK8GUvJABlIfX7K3+wPs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx57icLc623mZCQpOFe/pbPnUiLGVaR1Fg+sDxoScf6K0iGOsHV
	dL9TBpSSFmM4OIxwKV8BWR226S8hBoX6tclouobRb8Hr5K4PXRcHEuD2Ai2ZqrsCZgk=
X-Gm-Gg: ASbGncuEhmpzzYl5tqmapvBpgJeV8evqYF9WS+r4DIng0EE8Qav388UfleBWZx1XKA8
	7nbddFbHq0GueqN4UFk5fYYHI5mSm7aT3z51rzFRJ+eY67myGvWDRhKVqpfdmNMgTWEEYwILJg2
	cNzf4HhR+884TYajsLgx7a41K2NZZ+kg3lwoNSwts9bpKo5x/OBwrYU8kcQVgJ2cs3sj8ycckx8
	ChxgldHtDxLQb7RgZYA1T+dsawXaqE/XGdDRNjDf8DoSlKgOB+VgT/gmTTSb/7TJKaV0qq0ZgCz
	2LhMyytGqmTF+NUK7aSVS39LVZIOI5dT8WK5eeRhVQdKEGAycC6cSZSVaAUfMg==
X-Google-Smtp-Source: AGHT+IHxPOgGMF4E/igQ+9zuKWpkgI9g01pOMTJQFOuCNZV4sYhenQsuo3Rce+I6dtWKJJvUGA2Kwg==
X-Received: by 2002:a05:600c:3b8a:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-454a5629244mr48611805e9.6.1751529275924;
        Thu, 03 Jul 2025 00:54:35 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b4c:1be9:25d0:5634])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a9989fcesm18837365e9.16.2025.07.03.00.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 00:54:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/26] clk: amlogic: s4-peripherals: naming consistency
 alignment
In-Reply-To: <a7738c67-25fc-4919-bee8-69a72abb4871@amlogic.com> (Chuan Liu's
	message of "Thu, 3 Jul 2025 11:18:04 +0800")
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
	<20250702-meson-clk-cleanup-24-v1-12-e163c9a1fc21@baylibre.com>
	<a7738c67-25fc-4919-bee8-69a72abb4871@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 09:54:34 +0200
Message-ID: <1jsejdd805.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 03 Jul 2025 at 11:18, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Jerome:
>
>
> On 7/2/2025 11:26 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Amlogic clock controller drivers are all doing the same thing, more or
>> less. Yet, over the years, tiny (and often pointless) differences have
>> emerged.
>>
>> This makes reviews more difficult, allows some errors to slip through and
>> make it more difficult to exploit SoC commonalities, leading to code
>> duplication.
>>
>> This change enforce, wherever possible, a consistent and predictable scheme
>> when it comes to code organisation and naming, The scheme chosen is what
>> was used the most already, to try and minimise the size of the ugly
>> resulting diff. Here are some of the rules applied:
>> - Aligning clock names, variable names and IDs.
>>    - ID cannot change (used in DT)
>>    - Variable names w/ SoC name prefixes
>>    - Clock names w/o SoC name prefixes, except pclks for historic reasons
>> - Composite clock systematic naming : mux: X_sel, div:X_div, gate:X
>> - Parent table systematically named with the same name as the clock and
>>    a '_parents' suffix
>> - Group various tables next to the related clock
>> - etc ...
>>
>> Doing so removes what would otherwise show up as unrelated diff in
>> following changes. It will allow to introduce common definitions for
>> peripheral clocks, probe helpers, composite clocks, etc ... making further
>> review and maintenance easier.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   drivers/clk/meson/s4-peripherals.c | 746 ++++++++++++++++++-------------------
>>   1 file changed, 370 insertions(+), 376 deletions(-)
>>
>> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
>> index c9400cf54c84c3dc7c63d0636933951b0cac230c..9bcd35f12836de5e318fd1ad9c9ae15a2bfc3dd7 100644
>> --- a/drivers/clk/meson/s4-peripherals.c
>> +++ b/drivers/clk/meson/s4-peripherals.c
>
>
> [...]
>
>
>> @@ -1320,7 +1320,7 @@ static struct clk_regmap s4_ts_clk_gate = {
>>    * mux because it does top-to-bottom updates the each clock tree and
>>    * switches to the "inactive" one when CLK_SET_RATE_GATE is set.
>>    */
>> -static const struct clk_parent_data s4_mali_0_1_parent_data[] = {
>> +static const struct clk_parent_data s4_mali_parents[] = {
>>          { .fw_name = "xtal", },
>>          { .fw_name = "gp0_pll", },
>>          { .fw_name = "hifi_pll", },
>> @@ -1340,8 +1340,8 @@ static struct clk_regmap s4_mali_0_sel = {
>>          .hw.init = &(struct clk_init_data){
>>                  .name = "mali_0_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_mali_0_1_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_mali_0_1_parent_data),
>> +               .parent_data = s4_mali_parents,
>> +               .num_parents = ARRAY_SIZE(s4_mali_parents),
>>                  /*
>>                   * Don't request the parent to change the rate because
>>                   * all GPU frequencies can be derived from the fclk_*
>> @@ -1394,8 +1394,8 @@ static struct clk_regmap s4_mali_1_sel = {
>>          .hw.init = &(struct clk_init_data){
>>                  .name = "mali_1_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_mali_0_1_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_mali_0_1_parent_data),
>> +               .parent_data = s4_mali_parents,
>> +               .num_parents = ARRAY_SIZE(s4_mali_parents),
>>                  .flags = 0,
>>          },
>>   };
>> @@ -1433,28 +1433,26 @@ static struct clk_regmap s4_mali_1 = {
>>          },
>>   };
>>
>> -static const struct clk_hw *s4_mali_parent_hws[] = {
>> -       &s4_mali_0.hw,
>> -       &s4_mali_1.hw
>> -};
>> -
>> -static struct clk_regmap s4_mali_mux = {
>> +static struct clk_regmap s4_mali_sel = {
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_MALI_CLK_CTRL,
>>                  .mask = 1,
>>                  .shift = 31,
>>          },
>>          .hw.init = &(struct clk_init_data){
>> -               .name = "mali",
>> +               .name = "mali_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_hws = s4_mali_parent_hws,
>> +               .parent_hws = (const struct clk_hw *[]) {
>> +                       &s4_mali_0.hw,
>> +                       &s4_mali_1.hw,
>> +               },
>>                  .num_parents = 2,
>>                  .flags = CLK_SET_RATE_PARENT,
>>          },
>>   };
>>
>>   /* VDEC clocks */
>> -static const struct clk_parent_data s4_dec_parent_data[] = {
>> +static const struct clk_parent_data s4_dec_parents[] = {
>>          { .fw_name = "fclk_div2p5", },
>>          { .fw_name = "fclk_div3", },
>>          { .fw_name = "fclk_div4", },
>> @@ -1465,7 +1463,7 @@ static const struct clk_parent_data s4_dec_parent_data[] = {
>>          { .fw_name = "xtal", }
>>   };
>>
>> -static struct clk_regmap s4_vdec_p0_mux = {
>> +static struct clk_regmap s4_vdec_p0_sel = {
>
>
> Since both vdec_clk and mali_clk are 'no glitch clock', should we also unify
> the naming from 's4_vdec_p0'/'s4_vdec_p1' to 's4_vdec_0'/'s4_vdec_1'?

Please have another look at the description.

As much as possible, I want the ID, clock name, and variable names
aligned. ID do not change and has that 'p' ... so no, the 'p' stays.

>
>
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VDEC_CLK_CTRL,
>>                  .mask = 0x7,
>> @@ -1473,10 +1471,10 @@ static struct clk_regmap s4_vdec_p0_mux = {
>>                  .flags = CLK_MUX_ROUND_CLOSEST,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "vdec_p0_mux",
>> +               .name = "vdec_p0_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_dec_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_dec_parent_data),
>> +               .parent_data = s4_dec_parents,
>> +               .num_parents = ARRAY_SIZE(s4_dec_parents),
>>                  .flags = 0,
>>          },
>>   };
>> @@ -1492,7 +1490,7 @@ static struct clk_regmap s4_vdec_p0_div = {
>>                  .name = "vdec_p0_div",
>>                  .ops = &clk_regmap_divider_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>> -                       &s4_vdec_p0_mux.hw
>> +                       &s4_vdec_p0_sel.hw
>>                  },
>>                  .num_parents = 1,
>>                  .flags = CLK_SET_RATE_PARENT,
>> @@ -1515,7 +1513,7 @@ static struct clk_regmap s4_vdec_p0 = {
>>          },
>>   };
>>
>> -static struct clk_regmap s4_vdec_p1_mux = {
>> +static struct clk_regmap s4_vdec_p1_sel = {
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VDEC3_CLK_CTRL,
>>                  .mask = 0x7,
>> @@ -1523,10 +1521,10 @@ static struct clk_regmap s4_vdec_p1_mux = {
>>                  .flags = CLK_MUX_ROUND_CLOSEST,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "vdec_p1_mux",
>> +               .name = "vdec_p1_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_dec_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_dec_parent_data),
>> +               .parent_data = s4_dec_parents,
>> +               .num_parents = ARRAY_SIZE(s4_dec_parents),
>>                  .flags = 0,
>>          },
>>   };
>> @@ -1542,7 +1540,7 @@ static struct clk_regmap s4_vdec_p1_div = {
>>                  .name = "vdec_p1_div",
>>                  .ops = &clk_regmap_divider_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>> -                       &s4_vdec_p1_mux.hw
>> +                       &s4_vdec_p1_sel.hw
>>                  },
>>                  .num_parents = 1,
>>                  .flags = CLK_SET_RATE_PARENT,
>> @@ -1565,27 +1563,25 @@ static struct clk_regmap s4_vdec_p1 = {
>>          },
>>   };
>>
>> -static const struct clk_hw *s4_vdec_mux_parent_hws[] = {
>> -       &s4_vdec_p0.hw,
>> -       &s4_vdec_p1.hw
>> -};
>> -
>> -static struct clk_regmap s4_vdec_mux = {
>> +static struct clk_regmap s4_vdec_sel = {
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VDEC3_CLK_CTRL,
>>                  .mask = 0x1,
>>                  .shift = 15,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "vdec_mux",
>> +               .name = "vdec_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_hws = s4_vdec_mux_parent_hws,
>> -               .num_parents = ARRAY_SIZE(s4_vdec_mux_parent_hws),
>> +               .parent_hws = (const struct clk_hw *[]) {
>> +                       &s4_vdec_p0.hw,
>> +                       &s4_vdec_p1.hw,
>> +               },
>> +               .num_parents = 2,
>>                  .flags = CLK_SET_RATE_PARENT,
>>          },
>>   };
>>
>> -static struct clk_regmap s4_hevcf_p0_mux = {
>> +static struct clk_regmap s4_hevcf_p0_sel = {
>
>
> +static struct clk_regmap s4_hevcf_0_sel
> +static struct clk_regmap s4_hevcf_0_div
> .
> .
> .
>
>
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VDEC2_CLK_CTRL,
>>                  .mask = 0x7,
>> @@ -1593,10 +1589,10 @@ static struct clk_regmap s4_hevcf_p0_mux = {
>>                  .flags = CLK_MUX_ROUND_CLOSEST,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "hevcf_p0_mux",
>> +               .name = "hevcf_p0_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_dec_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_dec_parent_data),
>> +               .parent_data = s4_dec_parents,
>> +               .num_parents = ARRAY_SIZE(s4_dec_parents),
>>                  .flags = 0,
>>          },
>>   };
>> @@ -1612,7 +1608,7 @@ static struct clk_regmap s4_hevcf_p0_div = {
>>                  .name = "hevcf_p0_div",
>>                  .ops = &clk_regmap_divider_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>> -                       &s4_hevcf_p0_mux.hw
>> +                       &s4_hevcf_p0_sel.hw
>>                  },
>>                  .num_parents = 1,
>>                  .flags = CLK_SET_RATE_PARENT,
>> @@ -1625,7 +1621,7 @@ static struct clk_regmap s4_hevcf_p0 = {
>>                  .bit_idx = 8,
>>          },
>>          .hw.init = &(struct clk_init_data){
>> -               .name = "hevcf_p0_gate",
>> +               .name = "hevcf_p0",
>>                  .ops = &clk_regmap_gate_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>>                          &s4_hevcf_p0_div.hw
>> @@ -1635,7 +1631,7 @@ static struct clk_regmap s4_hevcf_p0 = {
>>          },
>>   };
>>
>> -static struct clk_regmap s4_hevcf_p1_mux = {
>> +static struct clk_regmap s4_hevcf_p1_sel = {
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VDEC4_CLK_CTRL,
>>                  .mask = 0x7,
>> @@ -1643,10 +1639,10 @@ static struct clk_regmap s4_hevcf_p1_mux = {
>>                  .flags = CLK_MUX_ROUND_CLOSEST,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "hevcf_p1_mux",
>> +               .name = "hevcf_p1_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_dec_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_dec_parent_data),
>> +               .parent_data = s4_dec_parents,
>> +               .num_parents = ARRAY_SIZE(s4_dec_parents),
>>                  .flags = 0,
>>          },
>>   };
>> @@ -1662,7 +1658,7 @@ static struct clk_regmap s4_hevcf_p1_div = {
>>                  .name = "hevcf_p1_div",
>>                  .ops = &clk_regmap_divider_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>> -                       &s4_hevcf_p1_mux.hw
>> +                       &s4_hevcf_p1_sel.hw
>>                  },
>>                  .num_parents = 1,
>>                  .flags = CLK_SET_RATE_PARENT,
>> @@ -1685,28 +1681,26 @@ static struct clk_regmap s4_hevcf_p1 = {
>>          },
>>   };
>>
>> -static const struct clk_hw *s4_hevcf_mux_parent_hws[] = {
>> -       &s4_hevcf_p0.hw,
>> -       &s4_hevcf_p1.hw
>> -};
>> -
>> -static struct clk_regmap s4_hevcf_mux = {
>> +static struct clk_regmap s4_hevcf_sel = {
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VDEC4_CLK_CTRL,
>>                  .mask = 0x1,
>>                  .shift = 15,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "hevcf",
>> +               .name = "hevcf_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_hws = s4_hevcf_mux_parent_hws,
>> -               .num_parents = ARRAY_SIZE(s4_hevcf_mux_parent_hws),
>> +               .parent_hws = (const struct clk_hw *[]) {
>> +                       &s4_hevcf_p0.hw,
>> +                       &s4_hevcf_p1.hw,
>> +               },
>> +               .num_parents = 2,
>>                  .flags = CLK_SET_RATE_PARENT,
>>          },
>>   };
>>
>>   /* VPU Clock */
>> -static const struct clk_parent_data s4_vpu_parent_data[] = {
>> +static const struct clk_parent_data s4_vpu_parents[] = {
>>          { .fw_name = "fclk_div3", },
>>          { .fw_name = "fclk_div4", },
>>          { .fw_name = "fclk_div5", },
>> @@ -1726,8 +1720,8 @@ static struct clk_regmap s4_vpu_0_sel = {
>>          .hw.init = &(struct clk_init_data){
>>                  .name = "vpu_0_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_vpu_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_vpu_parent_data),
>> +               .parent_data = s4_vpu_parents,
>> +               .num_parents = ARRAY_SIZE(s4_vpu_parents),
>>                  .flags = 0,
>>          },
>>   };
>> @@ -1770,8 +1764,8 @@ static struct clk_regmap s4_vpu_1_sel = {
>>          .hw.init = &(struct clk_init_data){
>>                  .name = "vpu_1_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_vpu_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_vpu_parent_data),
>> +               .parent_data = s4_vpu_parents,
>> +               .num_parents = ARRAY_SIZE(s4_vpu_parents),
>>                  .flags = 0,
>>          },
>>   };
>> @@ -1823,24 +1817,24 @@ static struct clk_regmap s4_vpu = {
>>          },
>>   };
>>
>> -static const struct clk_parent_data vpu_clkb_tmp_parent_data[] = {
>> +static const struct clk_parent_data vpu_clkb_tmp_parents[] = {
>>          { .hw = &s4_vpu.hw },
>>          { .fw_name = "fclk_div4", },
>>          { .fw_name = "fclk_div5", },
>>          { .fw_name = "fclk_div7", }
>>   };
>>
>> -static struct clk_regmap s4_vpu_clkb_tmp_mux = {
>> +static struct clk_regmap s4_vpu_clkb_tmp_sel = {
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VPU_CLKB_CTRL,
>>                  .mask = 0x3,
>>                  .shift = 20,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "vpu_clkb_tmp_mux",
>> +               .name = "vpu_clkb_tmp_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = vpu_clkb_tmp_parent_data,
>> -               .num_parents = ARRAY_SIZE(vpu_clkb_tmp_parent_data),
>> +               .parent_data = vpu_clkb_tmp_parents,
>> +               .num_parents = ARRAY_SIZE(vpu_clkb_tmp_parents),
>>                  .flags = CLK_SET_RATE_PARENT,
>>          },
>>   };
>> @@ -1855,7 +1849,7 @@ static struct clk_regmap s4_vpu_clkb_tmp_div = {
>>                  .name = "vpu_clkb_tmp_div",
>>                  .ops = &clk_regmap_divider_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>> -                       &s4_vpu_clkb_tmp_mux.hw
>> +                       &s4_vpu_clkb_tmp_sel.hw
>>                  },
>>                  .num_parents = 1,
>>                  .flags = CLK_SET_RATE_PARENT,
>> @@ -1911,7 +1905,7 @@ static struct clk_regmap s4_vpu_clkb = {
>>          },
>>   };
>>
>> -static const struct clk_parent_data s4_vpu_clkc_parent_data[] = {
>> +static const struct clk_parent_data s4_vpu_clkc_parents[] = {
>>          { .fw_name = "fclk_div4", },
>>          { .fw_name = "fclk_div3", },
>>          { .fw_name = "fclk_div5", },
>> @@ -1922,17 +1916,17 @@ static const struct clk_parent_data s4_vpu_clkc_parent_data[] = {
>>          { .fw_name = "gp0_pll", },
>>   };
>>
>> -static struct clk_regmap s4_vpu_clkc_p0_mux  = {
>> +static struct clk_regmap s4_vpu_clkc_p0_sel  = {
>
>
> +static struct clk_regmap s4_vpu_clkc_0_sel
> +static struct clk_regmap s4_vpu_clkc_0_div
> .
> .
> .
>
>
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VPU_CLKC_CTRL,
>>                  .mask = 0x7,
>>                  .shift = 9,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "vpu_clkc_p0_mux",
>> +               .name = "vpu_clkc_p0_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_vpu_clkc_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_vpu_clkc_parent_data),
>> +               .parent_data = s4_vpu_clkc_parents,
>> +               .num_parents = ARRAY_SIZE(s4_vpu_clkc_parents),
>>                  .flags = 0,
>>          },
>>   };
>> @@ -1947,7 +1941,7 @@ static struct clk_regmap s4_vpu_clkc_p0_div = {
>>                  .name = "vpu_clkc_p0_div",
>>                  .ops = &clk_regmap_divider_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>> -                       &s4_vpu_clkc_p0_mux.hw
>> +                       &s4_vpu_clkc_p0_sel.hw
>>                  },
>>                  .num_parents = 1,
>>                  .flags = CLK_SET_RATE_PARENT,
>> @@ -1970,17 +1964,17 @@ static struct clk_regmap s4_vpu_clkc_p0 = {
>>          },
>>   };
>>
>> -static struct clk_regmap s4_vpu_clkc_p1_mux = {
>> +static struct clk_regmap s4_vpu_clkc_p1_sel = {
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VPU_CLKC_CTRL,
>>                  .mask = 0x7,
>>                  .shift = 25,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "vpu_clkc_p1_mux",
>> +               .name = "vpu_clkc_p1_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_data = s4_vpu_clkc_parent_data,
>> -               .num_parents = ARRAY_SIZE(s4_vpu_clkc_parent_data),
>> +               .parent_data = s4_vpu_clkc_parents,
>> +               .num_parents = ARRAY_SIZE(s4_vpu_clkc_parents),
>>                  .flags = 0,
>>          },
>>   };
>> @@ -1995,7 +1989,7 @@ static struct clk_regmap s4_vpu_clkc_p1_div = {
>>                  .name = "vpu_clkc_p1_div",
>>                  .ops = &clk_regmap_divider_ops,
>>                  .parent_hws = (const struct clk_hw *[]) {
>> -                       &s4_vpu_clkc_p1_mux.hw
>> +                       &s4_vpu_clkc_p1_sel.hw
>>                  },
>>                  .num_parents = 1,
>>                  .flags = CLK_SET_RATE_PARENT,
>> @@ -2018,28 +2012,26 @@ static struct clk_regmap s4_vpu_clkc_p1 = {
>>          },
>>   };
>>
>> -static const struct clk_hw *s4_vpu_mux_parent_hws[] = {
>> -       &s4_vpu_clkc_p0.hw,
>> -       &s4_vpu_clkc_p1.hw
>> -};
>> -
>> -static struct clk_regmap s4_vpu_clkc_mux = {
>> +static struct clk_regmap s4_vpu_clkc_sel = {
>>          .data = &(struct clk_regmap_mux_data){
>>                  .offset = CLKCTRL_VPU_CLKC_CTRL,
>>                  .mask = 0x1,
>>                  .shift = 31,
>>          },
>>          .hw.init = &(struct clk_init_data) {
>> -               .name = "vpu_clkc_mux",
>> +               .name = "vpu_clkc_sel",
>>                  .ops = &clk_regmap_mux_ops,
>> -               .parent_hws = s4_vpu_mux_parent_hws,
>> -               .num_parents = ARRAY_SIZE(s4_vpu_mux_parent_hws),
>> +               .parent_hws = (const struct clk_hw *[]) {
>> +                       &s4_vpu_clkc_p0.hw,
>> +                       &s4_vpu_clkc_p1.hw,
>> +               },
>> +               .num_parents = 2,
>>                  .flags = CLK_SET_RATE_PARENT,
>>          },
>>   };
>
>
> [...]
>
>
>>   MODULE_DESCRIPTION("Amlogic S4 Peripherals Clock Controller driver");
>>   MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");
>>
>> --
>> 2.47.2
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome

