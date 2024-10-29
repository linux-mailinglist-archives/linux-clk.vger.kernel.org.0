Return-Path: <linux-clk+bounces-13970-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD239B465A
	for <lists+linux-clk@lfdr.de>; Tue, 29 Oct 2024 11:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E11341C224D0
	for <lists+linux-clk@lfdr.de>; Tue, 29 Oct 2024 10:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C6C202F60;
	Tue, 29 Oct 2024 10:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="P/hTYegG"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E99191F8E
	for <linux-clk@vger.kernel.org>; Tue, 29 Oct 2024 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730196167; cv=none; b=ibWMZ8xEvACoHTU6SLv8fQ5857vLWXXns/kL6229QxJub8O5Wsi9GqR8vpKhm3t6fymgkZBjpKP0B4TETDQdFARUE0W8aIQjhp+ZEnmdk62yFogqbVZoxnVdYjmBHRo4E7lW1mv1QAoUk1Qcr7ytPymQJdeRutNbTvwZtUciyYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730196167; c=relaxed/simple;
	bh=GIHMHqxOvtpPeTqllzyrsniuNmng8Fl6C1CaUKUvGYM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BqFzal5wzbEKgOXLtUrxI2GnUW8DrhR2FLDU+rquQv0UCZK8y/R8lJhDKqC8TURCzDtIZVfcZ3Wd4CyvVAp+bubUpXOf7S8zD79RGnf7y4opmOUBb6384GVT6LXImi7S1J+QYbDhxvo07RhvYQ3n33jmfjxWeGS/gaq3EWFcMAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=P/hTYegG; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53a097aa3daso4578425e87.1
        for <linux-clk@vger.kernel.org>; Tue, 29 Oct 2024 03:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730196163; x=1730800963; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MtRHRHZJbxkUHwLfJyAruL0+r7u3eJytHHCH6YWzdlk=;
        b=P/hTYegGINBXOE3sTmQF73WhwqEKQoLRxQoxp2z5k30pgJrIQOOv91U5upBhI4ZXSH
         nPFL6J42UvB8GWddEE/pSONRrYNEC80xhdmEtPcyDJF2PSsnwC10ISkZ/nRnw44ylBkk
         LUjAkYh+YZOtigig7cqjzyy/KLTiMZ6L32MNyMgStWQ+RyfAgUdj4xc/vrn6f5s9NrA8
         Et727hEE6fTNtzX3yZ/W5h7rbn4xrq7uWnQel0V61J+7NXHupAHyE6YAjZtwx9qMRKq3
         af8rAv1YpDVF0E4zLNI1IgE31Rq2gHRL1vAOgfvKwWH7M4xYerVU2pBg/MuvcMRSupr6
         rMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730196163; x=1730800963;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MtRHRHZJbxkUHwLfJyAruL0+r7u3eJytHHCH6YWzdlk=;
        b=IqwllLYM5gNXiQdRVTOoScdn7am2GT7UiDNzvbKMPa43zSmfD0WXRfx2iOxwrgFx+a
         dt02+8c6exiD1BAbGd3pQ84FBvYM76lJCw+wsW/IcTbC/VcPo9YmBSkXvJwiJXlyMFUw
         0a5JqbBOx2/RkLzzrCDbLz8H/1NVg4K+28TMn75Y0+uVZQavroKWypHxjRf7p7FD7BA6
         HaypHJbf2Z9t+Gl76wW9O5HLBMnwFbST2TwbY3JiwQN9qKiUKgTEQzLnUcEBRR8vy/+a
         Zs4UnGPu4Ussm6MRRz/Pu4R6+BtbusWLPVLLmyV6Tb3xcn3PEqWHkscYxKal1ttGSRkA
         M3Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXzoYaTtTPi3KVZQGxQXgBTCkxpt56NF2KRZKbonIEwCQCE/n3NWkaTGwGmP/tSJmLDRfXC3xvnyLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoX7GhpXKbZbGkgaC9xt1yrSTQfriXYvMv5M9PWVN2hvFoD1X8
	fkOopGZie2iRJT16okwLayNoCUGSIVsJ47pA3b3oebDmS4SVCraurkXYXTQNQwc=
X-Google-Smtp-Source: AGHT+IGEwILz2Lx4Ssp9GAJRdhmg/Oj6nSmHRAC4gShR5qbr4sklCtvT1n0f4SFTSdo1a1GofvMf/A==
X-Received: by 2002:a05:6512:b22:b0:539:a2f5:2f1d with SMTP id 2adb3069b0e04-53b34c364fdmr4152665e87.61.1730196162581;
        Tue, 29 Oct 2024 03:02:42 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f65b:b446:12e7:273])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b712d6sm12023826f8f.78.2024.10.29.03.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:02:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Zicheng Qu <quzicheng@huawei.com>
Cc: <neil.armstrong@linaro.org>,  <mturquette@baylibre.com>,
  <sboyd@kernel.org>,  <khilman@baylibre.com>,
  <martin.blumenstingl@googlemail.com>,
  <linux-amlogic@lists.infradead.org>,  <linux-clk@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <tanghui20@huawei.com>,  <zhangqiao22@huawei.com>,
  <judy.chenhui@huawei.com>
Subject: Re: [PATCH] clk: meson clk-phase: fix division by zero in
 meson_clk_degrees_to_val()
In-Reply-To: <20241026072624.976199-1-quzicheng@huawei.com> (Zicheng Qu's
	message of "Sat, 26 Oct 2024 07:26:24 +0000")
References: <20241026072624.976199-1-quzicheng@huawei.com>
Date: Tue, 29 Oct 2024 11:02:41 +0100
Message-ID: <1j34kfuszi.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat 26 Oct 2024 at 07:26, Zicheng Qu <quzicheng@huawei.com> wrote:

> In the meson_clk_phase_set_phase() function, the variable phase->ph.width
> is of type u8, with a range of 0 to 255. When calling

Thanks for noticing this. Some remarks though ...

> meson_clk_degrees_to_val with width as an argument, if width > 8,
> phase_step(width) will return 0. Lead to a division by zero error in
> DIV_ROUND_CLOSEST(). The same issue exists in the
> meson_clk_triphase_set_phase() and meson_sclk_ws_inv_set_phase().

It would have been worth noting that the issue is hypothetical given
that all existing instance of the mentioned drivers have a phase width of 1.

>
> Fixes: 7b70689b07c1 ("clk: meson: add sclk-ws driver")

The "problem" did not appear with this commit.

> Cc: <stable@vger.kernel.org>
> Signed-off-by: Zicheng Qu <quzicheng@huawei.com>
> ---
>  drivers/clk/meson/clk-phase.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/clk/meson/clk-phase.c b/drivers/clk/meson/clk-phase.c
> index c1526fbfb6c4..b88d59b7a90d 100644
> --- a/drivers/clk/meson/clk-phase.c
> +++ b/drivers/clk/meson/clk-phase.c
> @@ -51,6 +51,9 @@ static int meson_clk_phase_set_phase(struct clk_hw *hw, int degrees)
>  	struct meson_clk_phase_data *phase = meson_clk_phase_data(clk);
>  	unsigned int val;
>  
> +	if (phase->ph.width > 8)
> +		return -EINVAL;
> +

I don't think erroring out on this condition is correct.
A phase encoded on more than 8 bit is valid.

I think casting width to 'unsigned int' in phase_step() would be better.

>  	val = meson_clk_degrees_to_val(degrees, phase->ph.width);
>  	meson_parm_write(clk->map, &phase->ph, val);
>  
> @@ -110,6 +113,9 @@ static int meson_clk_triphase_set_phase(struct clk_hw *hw, int degrees)
>  	struct meson_clk_triphase_data *tph = meson_clk_triphase_data(clk);
>  	unsigned int val;
>  
> +	if (tph->ph0.width > 8)
> +		return -EINVAL;
> +
>  	val = meson_clk_degrees_to_val(degrees, tph->ph0.width);
>  	meson_parm_write(clk->map, &tph->ph0, val);
>  	meson_parm_write(clk->map, &tph->ph1, val);
> @@ -167,6 +173,9 @@ static int meson_sclk_ws_inv_set_phase(struct clk_hw *hw, int degrees)
>  	struct meson_sclk_ws_inv_data *tph = meson_sclk_ws_inv_data(clk);
>  	unsigned int val;
>  
> +	if (tph->ph.width > 8)
> +		return -EINVAL;
> +
>  	val = meson_clk_degrees_to_val(degrees, tph->ph.width);
>  	meson_parm_write(clk->map, &tph->ph, val);
>  	meson_parm_write(clk->map, &tph->ws, val ? 0 : 1);

-- 
Jerome

