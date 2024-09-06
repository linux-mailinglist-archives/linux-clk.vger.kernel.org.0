Return-Path: <linux-clk+bounces-11794-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0825896EB14
	for <lists+linux-clk@lfdr.de>; Fri,  6 Sep 2024 08:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96F9028713B
	for <lists+linux-clk@lfdr.de>; Fri,  6 Sep 2024 06:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E094965C;
	Fri,  6 Sep 2024 06:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="c7aXSNpm"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7353613D891
	for <linux-clk@vger.kernel.org>; Fri,  6 Sep 2024 06:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725605751; cv=none; b=QRW66KsDj4++dMhSNBxjV61q/OUdO/ea9R5UM2CtlqvMDshHB6jOzV1f9YLUhy+8BcbYF/KwtXsoLG7UyL9iLAkmGQ8pt9jJ45bJlq3yGVOvqxEzveuRVe+pdM6vv6HdZL1R5KUcqK84fCZL0So5dhwV5jtBnJv8IIoRZa9OGl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725605751; c=relaxed/simple;
	bh=b7ERu1u+RZvnB2du3wS1+TNHr/1umqo9UDdZVtoPrcQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dNg4k8HnHq/geeL3S3mUEBqf5vVq+FH6xI85obAUqAiDeXc9SnmA5ZqrhfTokUX/E2pOkLjEGipqJF0oYaCwyeO+jHPZj3M+2oH8IGHmFUWPrbsJdW/pd3Yti3IEGRyy6N3l6J0WMv8r6P/lprdyxayWw6VEsMztiPTxrIWAKqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=c7aXSNpm; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374bd0da617so907714f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 05 Sep 2024 23:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725605748; x=1726210548; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RXVPGKCWkvIyxnOaace+gmP1pBIJW2/wUZj/AGb7QaY=;
        b=c7aXSNpm8nEMds3yUZFA6QKMpZCKDqZ991JXoxnQTz3ADR6IEe8lnzxX9dXZpZ62yq
         oWBlI1qSeWMBaZal6K+0Vb5Kzzg15CGVACYWfy174fO7t9QL+yypK0FZ0PWCoIRkNR7Z
         QvSG9gHB1n1o2acakxa1rfeqyktVOFxS5Sdqf/NVjNTkiPMpygwaXvJIqY3VRa6d/Kdl
         TSrBVOIxmDAZNGJKIT9DnUtMpi+pTffNce2wWs0g91evcKyI4pMKwJ+aXQq+IZ0tiflj
         9ER+5+2FU9En6TWTBesPvT7XpVT7faPXR3WGjWz4P6YzO/+LtimHzWX1PksiTbDdDwX8
         10Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725605748; x=1726210548;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RXVPGKCWkvIyxnOaace+gmP1pBIJW2/wUZj/AGb7QaY=;
        b=f6jXEuu8xeDde/kcLT2zbBkwvZ6znwjB4YIxd6YPtcGolw8rYR3LtN2Gx6ypYubXzB
         7Bbih+1e5dDzkNYri9FySmtDd+NtAYuPNqPgErMDESbrSptJt1cNTNyPgnpnKykSOyMR
         eBmR42ZZGJLIwMBjrmqZXXXicaelGT0EIJ8mMnEj+QX0t5EbGiIiljz5mF18gDKxYytU
         mTW+QkTopssqWYs2tvkq6gBfzoOloS1ZIIAX9RCQyyx0Rz7lKqXjFLm5eDoZ+w6Q1b1Q
         HBKnZbiBYGxkiza4K1tV1L2R/bPy5ImeegaT+GCLoUrxaRk/aRyrjIpR+Tt5HzpTkRcz
         JLgA==
X-Forwarded-Encrypted: i=1; AJvYcCXovebZnoitc/Z5JfwBZD9lATvD/+HILF3I/4xk9+tgoft0iBFXuUKEy1KkYHDvM8ENt67JQaGXML4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/CKsJ8Yo4bJRuJeV/zbvamWnYELhk5dc+fzHPDghxnrwyLW+H
	aXAdVz/xd3udXYsQq5zIkFr4JfIrHVBHD6Ea9R28K7to9wB2YSXnPIdihvCH3kY=
X-Google-Smtp-Source: AGHT+IGN9vDlwteKqK7cnYQWXkf07Qewxeb9HmZVyNNN7jUwDQ4VFe4yEkgEVz9AUOTtKtIhJ/ptBw==
X-Received: by 2002:a5d:5225:0:b0:36b:3384:40e5 with SMTP id ffacd0b85a97d-378895de480mr914131f8f.24.1725605746995;
        Thu, 05 Sep 2024 23:55:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:4e33:801c:cee0:ee57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-375348df4e8sm9303380f8f.115.2024.09.05.23.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 23:55:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: meson: c3: pll: hifi_pll frequency is not
 accurate
In-Reply-To: <20240906-fix_clk-v1-2-2977ef0d72e7@amlogic.com> (Chuan Liu via's
	message of "Fri, 06 Sep 2024 13:52:34 +0800")
References: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
	<20240906-fix_clk-v1-2-2977ef0d72e7@amlogic.com>
Date: Fri, 06 Sep 2024 08:55:46 +0200
Message-ID: <1jy145qnil.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 06 Sep 2024 at 13:52, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>

The patch title is not good. the clock innacurate ... Ok, but you are doing
something about it, right ? Plus just saying that is a bit vague.

How about something like "fix frac maximum value" ? This what you are
doing, right ?

>
> The fractional denominator of C3's hifi_pll fractional multiplier is
> fixed to 100000, so flag CLK_MESON_PLL_FIXED_FRAC_MAX is added.
>
> Fixes: 8a9a129dc565 ("clk: meson: c3: add support for the C3 SoC PLL clock")
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/c3-pll.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
> index 32bd2ed9d304..a350173efe90 100644
> --- a/drivers/clk/meson/c3-pll.c
> +++ b/drivers/clk/meson/c3-pll.c
> @@ -361,6 +361,7 @@ static struct clk_regmap hifi_pll_dco = {
>  		.range = &c3_gp0_pll_mult_range,
>  		.init_regs = c3_hifi_init_regs,
>  		.init_count = ARRAY_SIZE(c3_hifi_init_regs),
> +		.flags = CLK_MESON_PLL_FIXED_FRAC_MAX,
>  	},
>  	.hw.init = &(struct clk_init_data) {
>  		.name = "hifi_pll_dco",

-- 
Jerome

