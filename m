Return-Path: <linux-clk+bounces-8716-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 202CE91A083
	for <lists+linux-clk@lfdr.de>; Thu, 27 Jun 2024 09:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8186B20E15
	for <lists+linux-clk@lfdr.de>; Thu, 27 Jun 2024 07:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34FF4F20C;
	Thu, 27 Jun 2024 07:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="X65Mrvcn"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DC16D1B9
	for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2024 07:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719473846; cv=none; b=gLt4QhLx5Z6Y1I+H26LBWxZFj4stbJ8111r0C/TpuVvKCc5oOSX30667dFhNyxxByGP3vxp1qVY88mtkbLHzFRsqATwJM2RrvEaw7eLKdWo0e3oNq51jKDpoF3sI/iNxHatRI5E/VqDRSzEE8IKV6DpTe4ACZUujXf5HBc645EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719473846; c=relaxed/simple;
	bh=hXbsKE9P+kMorDTh4PaugXdXE0+kw7EJ5lOrjKsj/I4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gh3rLqA1ebz0SxZmjnBMVPCBvQfqLjBBwr9zRKw6IGwHT/SZLI35bVZ3QLZYzxqHRYy6hCfdGzhgbFoe8z2EaWbAGWlA92AVNhXA6MwK7ZxA/u3avC02DVa7Tvezvw1uitxK87vwOOKzM+XIj9E314q2HALvFEue2djA62lxunM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=X65Mrvcn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4255fc43f1cso9118065e9.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2024 00:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719473843; x=1720078643; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uSt7hWRFsJht1ykRpUwUhslZQwMHYadx10kyHUhna8M=;
        b=X65MrvcnUwHrZ/VdZNzA/7h+VpSnHnZY/4dkYEtIlBsVXXSuz/EEea0OGJHa/zvHhc
         Bde4ywbquV68SWfmAjWziQEBrQuWNnEhYfgCa0W6ClcdYhvsrO65jKL4jCg1+rKdpQGl
         KAJpkQ0jwJRSP+VtyZ6zMbIbS0RLfL4IJa2zrUL815eSDoC9fYM5PsWKsj5WplU+98u5
         +EE/zfhBHYs6EdZBAQVsQfX0a25qPAXk7zhxPncXPNkESgQa32LFBMwzCjvJ4ildVuQO
         /Zwqg4ZD9Mfk3dDPMpncA7c+P0cp9/MbNg9fqT1KzoYKTkiRtXk3Zhr1C5GTJIw/UBB5
         nL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719473843; x=1720078643;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSt7hWRFsJht1ykRpUwUhslZQwMHYadx10kyHUhna8M=;
        b=g74cAYQ05UUw6t7WvSnuzkvKUya4Vo0kGXtZAQzD8tIjSzngWgSvq871xRtpeP7OJo
         xhzu1s8OYQLkXBRVF8tHN+ol6NWwajDfSsU67hORqY7GGKQUi6a8stdcaVSjq58ejsWX
         bFp9VUJucMos4h/eUE2awDVyL/TMl4CeMsRLd9CX/OXqiHa1Z2Nn0o17p7GfGRnN6xs8
         S1+663DefpalGzj5Q6BICtXTWakBbW6VVXFdZTj26TkNFwz1VMv8rmIq/tu+a/w9F0cT
         yIl86z3bFPzmn5pclDV5PxeCRoa9ASEW2rmdnLoXbVITcJDKbzN+K+qTt6wnEL2ZaXtz
         oiKw==
X-Forwarded-Encrypted: i=1; AJvYcCUOdLdTXQajv7F+WPeH+rDZGWJaO/jsD1aQuTvzFsHLsD2G85jyiW6nhE/5zzXXsu9c7Nr42pZ4fSUwlCBmbUPD/5PNIVoPijNE
X-Gm-Message-State: AOJu0YwIzvYPLSujcbZQNLRsZL2n6+oIac3ZhVNnETinyjTT2vYwG2WU
	pUbL+UCZtsp3KU9A6Q2MnJ/xNepsyeQ3y3Ufl38+PVSg13BTtkNFSp9TQFHWfrQ=
X-Google-Smtp-Source: AGHT+IFCDR3ek9WFRsnqL1Rf0E2mq3qOmsfg2MEHg+17BZ3Z6O2N+Wf9FHrf4pZsNrsp4V3hXqzOFw==
X-Received: by 2002:a05:6000:2ab:b0:366:ec2c:8647 with SMTP id ffacd0b85a97d-366ec2c86f1mr9630916f8f.46.1719473842640;
        Thu, 27 Jun 2024 00:37:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:fc79:19e9:c4ba:4eb2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3674357c0e7sm972505f8f.10.2024.06.27.00.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:37:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,
  <linux-kernel@vger.kernel.org>,  <linux-amlogic@lists.infradead.org>,
  <linux-clk@vger.kernel.org>
Subject: Re: [RFC PATCH 0/9] reset: amlogic: move reset drivers out of CCF
In-Reply-To: <f7b13cc0-6155-4b0f-9f63-c35d73c3032f@salutedevices.com> (Jan
	Dakinevich's message of "Mon, 24 Jun 2024 16:48:08 +0300")
References: <20240516150842.705844-1-jbrunet@baylibre.com>
	<f7b13cc0-6155-4b0f-9f63-c35d73c3032f@salutedevices.com>
Date: Thu, 27 Jun 2024 09:37:21 +0200
Message-ID: <1jfrsyhm4u.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 24 Jun 2024 at 16:48, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> Jerome,
>
> Do you have any updates? I'm looking forward to these changes so I can
> continue my work on a1 audio clock controller driver.

You have been CCed on the whole series.
You can see for yourself that there is still discussion going on.

>
> On 5/16/24 18:08, Jerome Brunet wrote:
>> This RFC follows the discussion about having reset driver in the clock tree
>> [1]. Ideally those should reside in the reset part of tree.
>> 
>> Also the code of the amlogic reset driver is very similar between the 2 trees
>> and could use the same driver code.
>> 
>> This RFC moves the reset driver of audio clock controller of the g12 and
>> sm1 SoC family to the reset tree, using the auxiliary bus.
>> 
>> The infrastructure put in place is meant to be generic enough so we may
>> eventually also move the reset drivers in the meson8b and aoclk clock
>> controllers.
>> 
>> [1] https://lore.kernel.org/linux-clk/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org
>> 
>> Jerome Brunet (9):
>>   reset: amlogic: convert driver to regmap
>>   reset: amlogic: add driver parameters
>>   reset: amlogic: split the device and platform probe
>>   reset: amlogic: use reset number instead of register count
>>   reset: amlogic: add reset status support
>>   reset: amlogic: add toggle reset support
>>   reset: amlogic: add auxiliary reset driver support
>>   clk: meson: add auxiliary reset helper driver
>>   clk: amlogic: axg-audio: use the auxiliary reset driver
>> 
>>  drivers/clk/meson/Kconfig                     |   6 +
>>  drivers/clk/meson/Makefile                    |   1 +
>>  drivers/clk/meson/axg-audio.c                 | 108 +--------
>>  drivers/clk/meson/meson-clk-rst-aux.c         |  84 +++++++
>>  drivers/clk/meson/meson-clk-rst-aux.h         |  14 ++
>>  drivers/reset/Kconfig                         |   1 +
>>  drivers/reset/reset-meson.c                   | 210 ++++++++++++++----
>>  include/soc/amlogic/meson8b-auxiliary-reset.h |  17 ++
>>  8 files changed, 293 insertions(+), 148 deletions(-)
>>  create mode 100644 drivers/clk/meson/meson-clk-rst-aux.c
>>  create mode 100644 drivers/clk/meson/meson-clk-rst-aux.h
>>  create mode 100644 include/soc/amlogic/meson8b-auxiliary-reset.h
>> 

-- 
Jerome

