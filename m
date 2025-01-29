Return-Path: <linux-clk+bounces-17522-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 15194A222DF
	for <lists+linux-clk@lfdr.de>; Wed, 29 Jan 2025 18:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C074A7A24E2
	for <lists+linux-clk@lfdr.de>; Wed, 29 Jan 2025 17:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498591DFE02;
	Wed, 29 Jan 2025 17:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ah6bWrLz"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278D31DF739
	for <linux-clk@vger.kernel.org>; Wed, 29 Jan 2025 17:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738171479; cv=none; b=dv22h+ulEU4sTOJsdfD9hHr+tei4ElwWiAiMrpZmY0tongVHtVwpw81TuLAjl55SyUSXV2rtrA3fO2L7T/6mkNkYm3y2/oIimNuroaaOJLf2/xPN9qLQcm4By4ukEMAGwD33Hsz98NJ8He6Xq6BeevAYOwgXP4YF4JKRrV+5ZT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738171479; c=relaxed/simple;
	bh=02fTZLb8ZPcEBHX8UaSyDSptrzDEVk1zndO9dVXgz5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHxhrhdx5YQo4nDvCJ/t3KVQaQ96O6fz78Fzgi0YtRfWDQPq2YTeYMMDfKzOjgMXK8Tef6HFJLDmm/Zgd5VECBG3v8XmNHv7vLOodxExpeM+q3mMqCbToiHOSrINCNv7eiJV9v0eFz3qMusvtyxbxqbEI2KmdFfwRSbmvB5b9oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ah6bWrLz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43618283d48so51761375e9.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Jan 2025 09:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738171475; x=1738776275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=apyazMEhQSo8qF0MeJDavXOSu4X41kdb0EVpzv+wKjs=;
        b=ah6bWrLzqkgRZAViLvHImMvdH+f74h7eFdf9Q/aXurKZFbhVQJtqwStGBzjGiG2XSo
         RumnNIYl0FMzkZAehogakh4CAZ9ELSTDhkmGyn21YPnglEh4Y3cmEumQWRnwN83ZfQ+p
         azA6qbLCEZfqn+Q/co7iX1Qie2ZyU8wMQsdkCHQYMqNBSGqO4Y8UyStnIOkcOMg1Ap/x
         H/M43DwU+XWZjM6o7fGkDpisKJeW+BQK/pn58uZAH5dAa/JL5ZnxIKShXrULyeykVpuZ
         nYSmC3l7RX5UBbKX0+S05FGI5/TUmZYDpyiIzrGn8tLHId0ENuS+zRU2HiKTb0d8gMC6
         12pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738171475; x=1738776275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apyazMEhQSo8qF0MeJDavXOSu4X41kdb0EVpzv+wKjs=;
        b=R4LoeqYxqJCllTn3O5kNzD8c/b0ZTM+hY01rk7Zg3f1IS2x7+K+VpII7KE3SlqxFj6
         U7clACAsl+tGdRva5ch+9cBde9FHhOhnOnT/UrkzxCb7ZUr6kCYfRS72Pn49qirHK9E0
         icqzr/0HUwqDCFbRpP/P3pjmDU5LJlPAQ9zqjr/x/iytKD9pPXm4ACzHEm90yOCdjpIx
         gyrmCtZS7RXFQm4CHfkDpFg1KZKfMw5/18GIJwXscbokaeNjrF+ohvr70iXrWCrCTnPP
         VlELm2QS97AUz06TaskBtHhiBFxux1F3NbKdI8Ms0v+zD3mPn6Bp678cGOXiFSnqGmIL
         RpJw==
X-Forwarded-Encrypted: i=1; AJvYcCUBYNOTBwillt57/ROUoYmYsiLxdKGufu8IYk0zhSnRHfbEXadC2i+tLMR7pJbrjKPxFdraAAv4ApE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuypx/Av6fmB0AMVLvJ5picuvZK5S2GHQcJaaEUhKPLWBUhtTO
	U3LkZJekOLxpFhNezRaYVid4+LpJhknpPDDwMwnQzB3g+XZ2dpS8by5RYTbI83g=
X-Gm-Gg: ASbGncvEPrF+x+3ZbWC/tlnMC2xDRqZze9Dl5/JaAKtKWfuABUs2x3ZqnT6mSsZc5Hb
	YzXWqq/1bUOuvYH2lMumisJe0hLUMN8gIpKNXmUpQXM5N7LWxvkd7CSntrn6OCofGrwzrTOREPw
	hWc+OkT8dL4TR3tgOxODAOFmpukRTb5w4zcipFUjnuqbJi0mSTrNoK+37Td1KVXuF6YXkDTnx0a
	uqJs2/SGmpeI85yizGIBQ58LRitzncysQd9m5n+H/pDXlr/rHVcyjtenBf7sTKIvL6pfDcWpddP
	UlefQrjklpmgIf4FRA4Vr87UEmjmp/rI/rEyQMWK6jLUP65zjfTwtg==
X-Google-Smtp-Source: AGHT+IFnDe4/dtbPIGLCw/sImkenHK2DDv+ULBhTplI9CVAjt0kVdyPwIrTWfCJBnrEnbirx/h0Z9Q==
X-Received: by 2002:a05:600c:4e01:b0:435:136:75f6 with SMTP id 5b1f17b1804b1-438dc34b179mr38832105e9.0.1738171475469;
        Wed, 29 Jan 2025 09:24:35 -0800 (PST)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc518ddsm31002665e9.37.2025.01.29.09.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 09:24:34 -0800 (PST)
Date: Wed, 29 Jan 2025 18:24:32 +0100
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
	ulf.hansson@linaro.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
Message-ID: <Z5pkUNNvsWPjRQvy@mai.linaro.org>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

On Fri, Jan 03, 2025 at 06:38:01PM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> On the Renesas RZ/G3S (and other Renesas SoCs, e.g., RZ/G2{L, LC, UL}),
> clocks are managed through PM domains. These PM domains, registered on
> behalf of the clock controller driver, are configured with
> GENPD_FLAG_PM_CLK. In most of the Renesas drivers used by RZ SoCs, the
> clocks are enabled/disabled using runtime PM APIs.
> 
> During probe, devices are attached to the PM domain controlling their
> clocks. Similarly, during removal, devices are detached from the PM domain.
> 
> The detachment call stack is as follows:
> 
> device_driver_detach() ->
>   device_release_driver_internal() ->
>     __device_release_driver() ->
>       device_remove() ->
>         platform_remove() ->
> 	  dev_pm_domain_detach()
> 
> In the upcoming Renesas RZ/G3S thermal driver, the
> struct thermal_zone_device_ops::change_mode API is implemented to
> start/stop the thermal sensor unit. Register settings are updated within
> the change_mode API.
> 
> In case devres helpers are used for thermal zone register/unregister the
> struct thermal_zone_device_ops::change_mode API is invoked when the
> driver is unbound. The identified call stack is as follows:
> 
> device_driver_detach() ->
>   device_release_driver_internal() ->
>     device_unbind_cleanup() ->
>       devres_release_all() ->
>         devm_thermal_of_zone_release() ->
> 	  thermal_zone_device_disable() ->
> 	    thermal_zone_device_set_mode() ->
> 	      rzg3s_thermal_change_mode()
> 
> The device_unbind_cleanup() function is called after the thermal device is
> detached from the PM domain (via dev_pm_domain_detach()).
> 
> The rzg3s_thermal_change_mode() implementation calls
> pm_runtime_resume_and_get()/pm_runtime_put_autosuspend() before/after
> accessing the registers. However, during the unbind scenario, the
> devm_thermal_of_zone_release() is invoked after dev_pm_domain_detach().
> Consequently, the clocks are not enabled, as the device is removed from
> the PM domain at this time, leading to an Asynchronous SError Interrupt.
> The system cannot be used after this.

I've been through the driver before responding to this change. What is the
benefit of powering down / up (or clock off / on) the thermal sensor when
reading the temperature ?

I can understand for disable / enable but I don't get for the classic usage
where a governor will be reading the temperature regularly.

Would the IP need some cycles to capture the temperature accurately after the
clock is enabled ?

> Add thermal_of_zone_register()/thermal_of_zone_unregister(). These will
> be used in the upcomming RZ/G3S thermal driver.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

