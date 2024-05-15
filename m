Return-Path: <linux-clk+bounces-7058-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF128C6734
	for <lists+linux-clk@lfdr.de>; Wed, 15 May 2024 15:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B5CC1C2082F
	for <lists+linux-clk@lfdr.de>; Wed, 15 May 2024 13:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907CE127E2F;
	Wed, 15 May 2024 13:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="y8yWBySO"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54DA127E12
	for <linux-clk@vger.kernel.org>; Wed, 15 May 2024 13:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715779056; cv=none; b=RmnsXMrOQXbhgE7jyCb0Zz49DkmK4fGeVUZMNaGifbJ3QFt9IubQWJwsD1CXnoyGfVFNv8++v9z12DYjL1cgKSwUz/kgBsorLErDpWOxQwxuTWk1bSYn/w3hCqk0C6DLYNIvBoCeVE6rcD5fw1kBI8I+8ua5IVSJZS5lWoop0Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715779056; c=relaxed/simple;
	bh=IKDt0+fluY20ds2F3whtuDQEpT+RYSV83TYvQF9ISsU=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=T7f4QC7E+KzzJ5cb51V3q0IZ2xjEIFQofwPRq4arUY3Geg5UvFsc/nTuE4Ucl7pTtv2TX3s21QkI35rmyIaHJ2OIL4XdyMoFJsiCnSmho4E91S6xh0qBDz2l1+8T0xnVI0Xew8hGcPmItbZcvXs0HQK+hWe8OUeOstnY3YwHe14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=y8yWBySO; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-34da04e44a2so5364083f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 15 May 2024 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715779053; x=1716383853; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=Wkq99nuMEm3sK6ZhmvF3R71byoY0ssDC9KdU6I8CK5A=;
        b=y8yWBySODzKOrXTocmOTOkT9K7sz8VjJJdJUqW00F6S01xgEYlhaTyZo9X8xDvXXx8
         kmUHdEA058pmcFnGYYIWwXTGPCDP81V4y7MnENqq5xpyOOsH0lGB/hXyEmfN0PsggY82
         +illVCzmjdLWurdwn4Dald6+B/lnJz+b9mTR0bHZX3ebRbVRCYHSpG0bBl70Ny/zGMvl
         PXslhgPemaDy1Xy/StcT3hYm8crnLeBSAKutFM88teBVqhlp9gqU+4ysnD/fCywXwrdP
         VROEnKBDHQ1tpE8cpGk1KxN9HG28Qc3p7rvwa7FyTCZ9zMBFe9b9J5RfbYkAa8/sOGH8
         PkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715779053; x=1716383853;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wkq99nuMEm3sK6ZhmvF3R71byoY0ssDC9KdU6I8CK5A=;
        b=pLX0bXKJyPCo+bvIW4TS0X7SABzs7vguSuzbPTYdphasxGK90OEXypmWhIWttgVQFl
         jO2CrqgUTUo7jOUVtsG+U1RlKjwwptCoIj0Ihv4dQm3eKKHxpSirSwAK6Uvh5ggC2l24
         5QQaGYkjGtcBQRkBfSK1rq8FS7oDnmHVACL3gPlC7UltR89cKDErIVE67FqiuvV4M6aP
         y8/9OEBvGoErOgln5ZSflhcb5t81r17PGJ16TYmy+nFvCMqRwHqNrXcVWLEqQZle642y
         4MNXlkz6aNEF4JmCT8qE9IBtVvzMASIKOJaH5lT3IAxUbx6/lRyl/+jjO0l7bSzFITA2
         SHlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3B9eNNZi8FyRF17jsCjP5jLUnNxvfDRoFWn512QRadi9ND4AN/al5rYaBZiH/oo7q1AOCgiUAm8XwwlDspRMTcrlMlXWrnGc5
X-Gm-Message-State: AOJu0YwsQFhdx8B3kwxKtgwxmUJqFwH7SKolufwZwQrpb9KzX8+NubKY
	sVzLg0cy0BPDRpdLKEGe1Qgx+VzcfN4SfBMsSXM32EeqYgTEfaocsC4+JSA8KNI=
X-Google-Smtp-Source: AGHT+IE4YYUxY5plTBCwY46ojRAymJdS+bbjFNA9B11hQIBGI59XYOMg6b3oSsFO4BCii/+Aekb4iA==
X-Received: by 2002:adf:fe8c:0:b0:351:c7c7:985f with SMTP id ffacd0b85a97d-351c7c79963mr3745116f8f.53.1715779052826;
        Wed, 15 May 2024 06:17:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2893:1a8f:5988:776a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbbefdsm16424209f8f.94.2024.05.15.06.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 06:17:32 -0700 (PDT)
References: <20240510090933.19464-1-ddrokosov@salutedevices.com>
 <20240510090933.19464-3-ddrokosov@salutedevices.com>
 <20240511-secret-barcode-e25c722ddf1d@spud>
 <20240513091735.l3uewwzfrdd6qwbl@CAB-WSD-L081021>
 <20240513-epic-magnifier-8dd83db81c4c@spud>
 <20240513183012.652mwhivasqihiqc@CAB-WSD-L081021>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: Conor Dooley <conor@kernel.org>, neil.armstrong@linaro.org,
 jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: meson: a1: pll: introduce
 new syspll bindings
Date: Wed, 15 May 2024 15:15:35 +0200
In-reply-to: <20240513183012.652mwhivasqihiqc@CAB-WSD-L081021>
Message-ID: <1jh6ezxlhw.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Mon 13 May 2024 at 21:30, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> On Mon, May 13, 2024 at 04:48:33PM +0100, Conor Dooley wrote:
>> On Mon, May 13, 2024 at 12:18:02PM +0300, Dmitry Rokosov wrote:
>> > Hello Conor,
>> > 
>> > Thank you for quick review!
>> > 
>> > On Sat, May 11, 2024 at 02:08:03PM +0100, Conor Dooley wrote:
>> > > On Fri, May 10, 2024 at 12:08:54PM +0300, Dmitry Rokosov wrote:
>> > > > The 'syspll' PLL is a general-purpose PLL designed specifically for the
>> > > > CPU clock. It is capable of producing output frequencies within the
>> > > > range of 768MHz to 1536MHz.
>> > > > 
>> > > > The clock source sys_pll_div16, being one of the GEN clock parents,
>> > > > plays a crucial role and cannot be tagged as "optional". Unfortunately,
>> > > > it was not implemented earlier due to the cpu clock ctrl driver's
>> > > > pending status on the TODO list.
>> > > 
>> > > It's fine to not mark it optional in the binding, but it should be
>> > > optional in the driver as otherwise backwards compatibility will be
>> > > broken. Given this is an integral clock driver, sounds like it would
>> > > quite likely break booting on these devices if the driver doesn't treat
>> > > syspll_in as optional.
>> > > A lesson perhaps in describing the hardware entirely, even if the
>> > > drivers don't make use of all the information yet?
>> > 
>> > Yes, it's definitely the right lesson for me. However, without syspll or
>> > syspll_in, we cannot utilize CPU power management at all.
>> 
>> That's the status-quo, right? The incorrect dts would continue to not
>> support CPU power management and the new one with the correct description
>> would?
>
> Hmmm, correct. Okay, I see, I will support sys_pll as optional
> connection :)

Again, the way controller is written, all inputs are actually optional.
The controller does not error out if an input is missing, it behave as
if the input is disconnected

-- 
Jerome

