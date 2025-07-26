Return-Path: <linux-clk+bounces-25172-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB50CB129D3
	for <lists+linux-clk@lfdr.de>; Sat, 26 Jul 2025 11:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 679B77B51BA
	for <lists+linux-clk@lfdr.de>; Sat, 26 Jul 2025 09:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE0B20E31B;
	Sat, 26 Jul 2025 09:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="OCvbdlZn"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-69.smtpout.orange.fr [80.12.242.69])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926197B3E1;
	Sat, 26 Jul 2025 09:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753521440; cv=none; b=BdUAL3Gw9RFBitm9QDGhgCSjoRTPBslIA+IvjYs7VwmwIymynkA+CzOysrmaG54yX1MWzViC8V0tqxaeWm0GubD94zbaAfvfJ99JgbkJSO1u8zHwptrHYkvmaqUDJMTCmgwPmi9yzN79DKblmxRgOK/UKmCrmgMyksTDVEtkp5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753521440; c=relaxed/simple;
	bh=rYQXAPwFrkfu4EDcSXActYD6Nyvq+NgQYf/ZkZuhzlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AdJFaa96anJnnXW7CRezuI1gre/WcUf7Wura64GkubqlsMxG2AFnc5z+TICdRwI5ubrEmft5nhqzJ0iIoGWCdLJAoDNqg0etbXLMkGkQf/q23XWYldSfEx6DZJQPvyhiM9w7aN8E9e8TjcsL+TFyS0XnpQ5tuWvfH2ohCwvvbvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=OCvbdlZn; arc=none smtp.client-ip=80.12.242.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id fb0cukqvwUD3Ufb0cuKgwl; Sat, 26 Jul 2025 11:16:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1753521365;
	bh=U9kZSAtVAyocpLhrZ9KiXiugbdUh7RrQVALIu5fxuzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=OCvbdlZnVDK2N/wzU0aKjr2jm6Nsst80VLqT1nNeVHZbjWWsN6OFia3uA70eSfZNO
	 7OGU5fjPs/uNw0dxunLKRsUapLSG0ldiYlYJhscbgLMZKmoOfv3NTqNYbu6lk19A+m
	 /HXeKzkyrTTrq+oCFGpxRy2A4ClYVWK+UbyK+PzpsArrQN4yBmSVxEOrZUE/Axex6i
	 vBB9GusVrJEi/3wuH5acGlg1RJO6qimGCNkTmKCcN/ola7+YvE16gI9p9G6AmBI5Wa
	 hesOS78cOiZ1Ri3M6ppMsIF0b92fPNzpsmxcK0oVcU7A18HaisFjz+tlXamheXAE3z
	 Ud5fC/IqdwhQQ==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 26 Jul 2025 11:16:04 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <ed5fcfec-6330-46e8-a302-5cf1d8b3a9ce@wanadoo.fr>
Date: Sat, 26 Jul 2025 11:16:02 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: spacemit: fix resource leak in
 spacemit_ccu_reset_register
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, sboyd@kernel.org,
 dlan@gentoo.org
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 23/07/2025 à 15:25, Hendrik Hamerlinck a écrit :
> The function spacemit_ccu_reset_register() allocates memory for an
> auxiliary device. If auxiliary_device_add() fails, it skips cleanup of
> these resources, resulting in leaks.
> 
> Fix this by using the appropriate error handling path.
> 
> Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>
> ---
> Changes in v2:
> - Properly place the Fixes tip.
> ---
>   drivers/clk/spacemit/ccu-k1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 65e6de030717..5bb85e32c6cf 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -1059,7 +1059,7 @@ static int spacemit_ccu_reset_register(struct device *dev,
>   	ret = auxiliary_device_add(adev);
>   	if (ret) {
>   		auxiliary_device_uninit(adev);
> -		return ret;
> +		goto err_free_aux_id;
>   	}
>   
>   	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);


Hi,

I'm not sure this is correct.

auxiliary_device_uninit() which is called if auxiliary_device_add() 
fails should already do the clean-up.

So I would say that this patch adds a double-free issue and should not 
be applied.

If I'm right, note that Stephen has already added a "Applied to clk-next"

CJ



