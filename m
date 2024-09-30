Return-Path: <linux-clk+bounces-12558-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D639998A262
	for <lists+linux-clk@lfdr.de>; Mon, 30 Sep 2024 14:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7154E1F20F7D
	for <lists+linux-clk@lfdr.de>; Mon, 30 Sep 2024 12:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C43F18EFF5;
	Mon, 30 Sep 2024 12:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xsNOmBj+"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3C518E36C
	for <linux-clk@vger.kernel.org>; Mon, 30 Sep 2024 12:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727699231; cv=none; b=ihPQpNbTCjuzLeslQtGXwNH1/W5qGJ7BmmOOsR748K99R/Wd4b15azWlL57pKFHC7Z8MipFMr3+E7crMWvDClmKPLLQJIyJIMv9/KXX4/8R/S2J9542/4nrRNPa7BHALaGqYBZBSx7huGXWqdJsBgCl+Pr0xVktEMX7bdsaeTd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727699231; c=relaxed/simple;
	bh=9luUmW0e0udbsWVyb6Sp3e6/GNXruTPLS3d+14tW2rI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZFA8yRV2D3BruRNqG/eCQu6YnrK8BOEgFWby1ROmFt3XgsaCjhJs8XDfjY+jG+q/MdFxQToMO69hZxNq0mCUw63yeui6bK/zkRd0MdFSreEWvFqUpXO1Gxmw3GwiwXR8WBZEVeR0xe1U+D40Eb0LKNikGyTajsxy2H/GKEq+VpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xsNOmBj+; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37ce6a5b785so706557f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Sep 2024 05:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727699226; x=1728304026; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TnfvxkU+3SpvaCEsw37+aVnbvjFaWPB2+8ZOExgpE60=;
        b=xsNOmBj+J6zGTNSWjHtXgDpVsb3dww5vFJfnmKWVB8yJpFK1wilADKKPH2IzZMM6Cf
         VFacb7EalZqUr0WVM+SRlc9xcACE8LgAcRfZU5TsZ9EFaECFBUjEdvC+tJ8TiHKrl4yv
         xLsBv05WJfOR0ezUQa+OcB8H2UUC93ERU1hYbyRYdoa3xGL3Wjx++j9yAeG78R3Ql1eD
         mt8zXcALFGJ9dfz7zmE3lmXfBOZ6e8gyl3m0yD8F2RkZFAeFCv5kKp2n8FTN9NB5wfLR
         fat9c1IkEodNc0s2pz4v6D0bON6RuU18XfKROD4HIODObiC2LoMG93k3XOzq2n6JgeAU
         tokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699226; x=1728304026;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TnfvxkU+3SpvaCEsw37+aVnbvjFaWPB2+8ZOExgpE60=;
        b=d7voPRgHPnjZAEolpsh9eLJ1Ci2ndQCfgUo/Fk82s77It+cC1xQTgudP7Nka0MpnX9
         79OFCICRbW/y8PFPX/6Qn7a+Qu4sxg+PiDCi5rH3j/M7ThjoQilodIiCNn08wSskK7kC
         InayZ63Z9KLWndRrj2kzvfQMfv70393kmoZQ7WhZvyAo0FTAXswhPfnoNnMb1ivnizUj
         qz8k3NIwOm0PEcCJZH8WpadrYlUaRpDGC7UYlmqFrcDDJkz6V2aPBy6zuMZaWQSUsClB
         zpOP/uA9Eaiz3RSExzfwQ+HRzAir6EX1Se4eegX9Bs5AzN7J3RyUMXjwar1Um/yUXdLd
         WpYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOjk+1OuBJtLQdiT2urJud/d1fN+Di4XKNXK0Ts4ObeO4CSo9fRwsS3UdrgaEoYRytOvPv6XhoGh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YziKxpY5qEt2W9J9/E969evWsD6s42V+FhanuwKlnJ4UuAv+ouH
	B8SHdycFSy24GryejqF1ylzDMuhvkPDFMIjBDXRdKzUXJDmrld9I9vUbv+EcXZ8=
X-Google-Smtp-Source: AGHT+IE14OFcN1Aoo5OXrKzTjQCJkSgzSoOhRyTY+Vz61AiXH/EbYZGwPtPCvJZVvzG7X4TErPBjKw==
X-Received: by 2002:a5d:500f:0:b0:374:ba78:9013 with SMTP id ffacd0b85a97d-37cd568e21cmr6844128f8f.9.1727699226325;
        Mon, 30 Sep 2024 05:27:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b6ba:bab:ced3:2667])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5752a09sm8911834f8f.108.2024.09.30.05.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:27:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] clk: Fix the CLK_IGNORE_UNUSED failure issue
In-Reply-To: <20240929-fix_glitch_free-v1-1-22f9c36b7edf@amlogic.com> (Chuan
	Liu via's message of "Sun, 29 Sep 2024 14:10:05 +0800")
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
	<20240929-fix_glitch_free-v1-1-22f9c36b7edf@amlogic.com>
Date: Mon, 30 Sep 2024 14:27:04 +0200
Message-ID: <1jed51tjhj.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun 29 Sep 2024 at 14:10, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> When the clk_disable_unused_subtree() function disables an unused clock,
> if CLK_OPS_PARENT_ENABLE is configured on the clock,
> clk_core_prepare_enable() and clk_core_disable_unprepare() are called
> directly, and these two functions do not determine CLK_IGNORE_UNUSED,
> This causes the clock to be disabled even if CLK_IGNORE_UNUSED is
> configured when clk_core_disable_unprepare() is called.
>
> Two new functions clk_disable_unprepare_unused() and
> clk_prepare_enable_unused() are added to resolve the preceding
> situation. The CLK_IGNORE_UNUSED judgment logic is added to these two
> functions. To prevent clock configuration CLK_IGNORE_UNUSED from
> possible failure.
>
> Change-Id: I56943e17b86436254f07d9b8cdbc35599328d519
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/clk.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 65 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 285ed1ad8a37..5d3316699b57 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -94,6 +94,7 @@ struct clk_core {
>  	struct hlist_node	debug_node;
>  #endif
>  	struct kref		ref;
> +	bool			ignore_enabled;
>  };
>  
>  #define CREATE_TRACE_POINTS
> @@ -1479,6 +1480,68 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
>  	}
>  }
>  
> +static void __init clk_disable_unprepare_unused(struct clk_core *core)
> +{
> +	unsigned long flags;
> +
> +	lockdep_assert_held(&prepare_lock);
> +
> +	if (!core)
> +		return;
> +
> +	if ((core->enable_count == 0) && core->ops->disable &&
> +	    !core->ignore_enabled) {
> +		flags = clk_enable_lock();

Used core->enable_count without taking the lock

> +		core->ops->disable(core->hw);

If the there is any CLK_IS_CRITICAL in the path, it is game over.
You've basically disregarded all the other CCF flags which are equally
important to the ones you are dealing with.

> +		clk_enable_unlock(flags);
> +	}
> +
> +	if ((core->prepare_count == 0) && core->ops->unprepare &&
> +	    !core->ignore_enabled)
> +		core->ops->unprepare(core->hw);
> +
> +	core->ignore_enabled = false;
> +
> +	clk_disable_unprepare_unused(core->parent);

Here you are disabling the parent of any CLK_IGNORE_UNUSED clock.
IMO, the problem is not solved. It just shifted.

> +}
> +
> +static int __init clk_prepare_enable_unused(struct clk_core *core)
> +{
> +	int ret = 0;
> +	unsigned long flags;
> +
> +	lockdep_assert_held(&prepare_lock);
> +
> +	if (!core)
> +		return 0;
> +
> +	ret = clk_prepare_enable_unused(core->parent);
> +	if (ret)
> +		return ret;

That's adding another recursion in CCF, something Stephen would like to remove

> +
> +	if ((core->flags & CLK_IGNORE_UNUSED) && clk_core_is_enabled(core))
> +		core->ignore_enabled = true;
> +
> +	if ((core->prepare_count == 0) && core->ops->prepare) {
> +		ret = core->ops->prepare(core->hw);
> +		if (ret)
> +			goto disable_unprepare;
> +	}
> +
> +	if ((core->enable_count == 0) && core->ops->enable) {
> +		flags = clk_enable_lock();
> +		ret = core->ops->enable(core->hw);
> +		clk_enable_unlock(flags);
> +		if (ret)
> +			goto disable_unprepare;
> +	}
> +
> +	return 0;
> +disable_unprepare:
> +	clk_disable_unprepare_unused(core->parent);
> +	return ret;
> +}
> +
>  static void __init clk_disable_unused_subtree(struct clk_core *core)
>  {
>  	struct clk_core *child;
> @@ -1490,7 +1553,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
>  		clk_disable_unused_subtree(child);
>  
>  	if (core->flags & CLK_OPS_PARENT_ENABLE)
> -		clk_core_prepare_enable(core->parent);
> +		clk_prepare_enable_unused(core->parent);
>  
>  	flags = clk_enable_lock();
>  
> @@ -1517,7 +1580,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
>  unlock_out:
>  	clk_enable_unlock(flags);
>  	if (core->flags & CLK_OPS_PARENT_ENABLE)
> -		clk_core_disable_unprepare(core->parent);
> +		clk_disable_unprepare_unused(core->parent);
>  }
>  
>  static bool clk_ignore_unused __initdata;

-- 
Jerome

