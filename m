Return-Path: <linux-clk+bounces-9643-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10447932156
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2024 09:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEEAD2819FD
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2024 07:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11532C1B4;
	Tue, 16 Jul 2024 07:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NvCEY+Or"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6890355894
	for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 07:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721115479; cv=none; b=kZV0Jbt8X552bmN9NnhgwTTzptOxugEBvMA9wilJ93KZxL+jxvb+0i0CQtAqC2v5HhFl+H91aeagPXJRWDqgvYLigT9BIQSKcVxFnq0A3uHs5NnTHn61SnZogcPCo4LpbZC9YUzLFj9ITQxJd/bEcHfASH0CYXH5Z/SDITV8HRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721115479; c=relaxed/simple;
	bh=wsUa+mBMkgyWtarKas9SFHQq+I+2BbQrdnIErDGX1R4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jWpu/LAOp2adLigJ887kPKFSQrjagLLWesqECnODhwQWFbMD03V2nFiO4gc+N6TO/gtWsmn84vAmETmOp5YmM77eX+8BvJoHu26aQY9ooawxdlnX5s+JxK79AvWRM/Ro4c5oi38ga6byVerltG33zxhVZRZ8+L9iipbGBqxOu/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NvCEY+Or; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-367a081d1cdso2742796f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 00:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721115476; x=1721720276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+OQpy4G4Eje5USDo7g38LRCjo6XrgBahA9NpvAvy43o=;
        b=NvCEY+OrIE6vH9XxXuOq7bhFEnApX5AibzOsV0acacgXQSIAgpTZDPmw2MeQ1NelcA
         C7J+CSIMYpL0qZXrUg+lFh5RR6T0pZ6AThNeqNmgLpROJdJNSsnGpi1c6ZDChajIuOUK
         oak/fvXVfU1X/hjkyLqBtj3laUIQOYlksCqs5gxN9uMBwOYmwqufZ95wDvOGKYkUSw0L
         arpAxZGJ/lCYI5XvR9rE8u3YgNz8qvHNS7e1OYZEbirDkBFi0vHVog0/pg+BPI3AWCP3
         fB3+cVtVwjKINMwvwomA7fxMcmtH8GQjioXAv7+1U2jgVMOC7HlJCe4MvjMB/Qxa8o1L
         lAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721115476; x=1721720276;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+OQpy4G4Eje5USDo7g38LRCjo6XrgBahA9NpvAvy43o=;
        b=obdSfeXwe0ZpJPX1kXZGHKDNZh2OD9YYU1GsNYDoH5Zof06aArOXkmjrDCr8uIQWUG
         OVZRmmDvg+EGdFfiiKKEpoRCBBx5Sx8LsmO7zKtIs+hRh93odE5ZDQU6h5MyVUcAaNCj
         LGLU+XF3wYIAZI05X2geSGAJl68QG09d3/F8r4oW1Ohleju82DmSgZ7frA0EqmXWBnNn
         xNKq/sSJoYSG2q/rVNZdJInCpzgKjSabW0FBYE0WRbg6/2yL3y7eDQ13KVP33bOC34KL
         pAiCSMOu8DcatNskJ1SFzIF9lrL8Oz3TOjG+tfZZrLBRX8tA0zswnVRafyMkdnHGmlab
         HWuA==
X-Gm-Message-State: AOJu0YyF/u9dbcvH3LWDF6FL0i0ufg7b7Ysa1nvTED4tf/f1tc7TtNbj
	boHGfcTqV5d5ddi349jmpS7IYMH3VT4+IAzfCB4oslPVQand8rsV1tYrEOT5RWU=
X-Google-Smtp-Source: AGHT+IFumldrPx/zMqUUoMsoLTBo0cyX3qA2ouOy8XlozJcYo16CimUEt8u5IYn604xDgWRpoZY2wg==
X-Received: by 2002:a5d:5f42:0:b0:366:eade:bfbb with SMTP id ffacd0b85a97d-3682631fae8mr1021856f8f.46.1721115475606;
        Tue, 16 Jul 2024 00:37:55 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dabf1a0sm8190205f8f.28.2024.07.16.00.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 00:37:55 -0700 (PDT)
Message-ID: <ca920d7c-43a5-4961-acb2-3b3eae9ee286@tuxon.dev>
Date: Tue, 16 Jul 2024 10:37:53 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: at91: sama7g5: Allocate only the needed amount of
 memory for PLLs
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, alexandre.belloni@bootlin.com,
 mturquette@baylibre.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240714141315.19480-1-claudiu.beznea@tuxon.dev>
 <2a56789d4f1eaa97ec91392f93741f19.sboyd@kernel.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <2a56789d4f1eaa97ec91392f93741f19.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15.07.2024 22:47, Stephen Boyd wrote:
> Quoting Claudiu Beznea (2024-07-14 07:13:15)
>> The maximum number of PLL components on SAMA7G5 is 3 (one fractional
>> part and 2 dividers). Allocate the needed amount of memory for
>> sama7g5_plls 2d array. Previous code used to allocate 7 array entries for
>> each PLL. While at it, replace 3 with PLL_COMPID_MAX in the loop which
>> parses the sama7g5_plls 2d array.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> ---
> 
> Might as well add a Fixes tag so we know when it was less efficient and
> to help anyone trying to backport this driver.

That would be:

Fixes: cb783bbbcf54 ("clk: at91: sama7g5: add clock support for sama7g5")

Thank you,
Claudiu Beznea

> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>

