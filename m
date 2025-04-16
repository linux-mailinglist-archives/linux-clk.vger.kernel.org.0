Return-Path: <linux-clk+bounces-20624-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B49BA89F06
	for <lists+linux-clk@lfdr.de>; Tue, 15 Apr 2025 15:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64D49188D486
	for <lists+linux-clk@lfdr.de>; Tue, 15 Apr 2025 13:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C33B2973D9;
	Tue, 15 Apr 2025 13:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eySQngpM"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAD42951DD
	for <linux-clk@vger.kernel.org>; Tue, 15 Apr 2025 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722644; cv=none; b=oux+snryaX0CtWeRduKLmhjAQLNuf5gkStCHJFoeU/8WSDwMBm3HG1psBXABzndPGqYseczgkDn4xfjfNp+yBmu0BXK5eS9ACpCTTGcxHd8sPJJTNwhD6kDkRcSOMOGiMFBd6fprMYgpzC/TcHVs/t1cvrqYBRkodhT1ufU1rao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722644; c=relaxed/simple;
	bh=U9q3F6WYr0uTgYuQABRm79Mx6T785oqOsPiGWvuy+s4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hSysqoPC8nEchAgFO0l2AJASMKZUi12p4N0zVdqTvcYvt1y8fadKZrNF4AUL9ru7IWLFQdB7Nm2yKgDgK1N5eg2ZqLncV3ZIXRq2EFwlIT6HouiyBHKBzniqjK9r3t+Z4g4vzK0pxXpjZHXgU7SzIMf7xwQ33xgYMdBID2AKGDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eySQngpM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43690d4605dso43617215e9.0
        for <linux-clk@vger.kernel.org>; Tue, 15 Apr 2025 06:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744722640; x=1745327440; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zs7KnnfZKLyJy3tHcV0Bgj/q4jqUjfal2AfLl4HBPO0=;
        b=eySQngpMW4Ofeee0Y+gyWSD0Ot1AS5kYqFyHghnhMzTz3RdNpBFviq069H06XkkFli
         e+TmliWPx9Sp+V2KX6Nnuiwbt1N4yTxZ/3B9fJhWTMUUnBaX28jyU3Ab07mY9PbvlmNY
         cqJRcU1ZKbFhSnQksJrKEBw4EWfsfRuEynZsZzsGVFJeHc9ODNAPMx6uSH+E0VSUeZ2j
         DTnv0+wMfuRLTs8NEeuLJxcTb+pXpf68x5xOh/gJqtBrc2OiBgI8/6tetuj/6g3m7nFh
         sGjQJB2MJNZU+rO6NJbgnQQTUgygngMubtI9uwv3arkgfUZGtW6a/HazS+Vgi5IXetbH
         4abA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744722640; x=1745327440;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs7KnnfZKLyJy3tHcV0Bgj/q4jqUjfal2AfLl4HBPO0=;
        b=NhmK+A3fgInmzKeiRe7T7LAeUBPSLyooXbuUYhcnBabHyL7MRqrA0psYxLuE68Rmra
         fOg5CYvWmRWlNUF1qjiOCgDiYtdnlFfSs1UwO3/LlVYsj1ouqrLJMYJezdXzml1uuaAN
         3jP7VgTmsKAZkhtb8QwaIYFZg8+gWnrs3Lq4qMNwci/IhpSZKvJ2nsUENNHbB4EQdRtD
         JZSw7FKrdQ3z2xaVUnY08TO4zz61ZqTRre4A+9wI2acemhoScEniqb7PH2VxoguS0Cw2
         nNJ5mOGCMCNbyM0+smFDLANFYv9cK4eaZYafE0wc6t8ZezLZzuH0CQs42gBGb0BhXJR1
         b74g==
X-Forwarded-Encrypted: i=1; AJvYcCUHZlxfUh4Sm6Y/liLzloG/VYToXyM9ARJHVrogfi/BQwPv76Y/lCUt/eimHQSxMhuh1uhdPSTOdRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKXOxxqbiCQUKQIR50r7Or6/32nCDZHFM40v8B86OYzjyOA178
	mAOjrOxQE1egJXoWaNbjXrGDhTKZFtxrq0ssyvry4efEarjyXCfCvWHIET+/RfY=
X-Gm-Gg: ASbGncsTeK0IT4iQCpjI1yUDi5zlZPN1dO6lpqTO3nFRy2fSpweC6bQKw84hvmf7a4S
	2gChVQFqMPiMK/qpZNy/0SsxwFvln9yd/LhNQbqV3aWBlReQdfsUemf2fgXe1fN4EPzFPaJ88Bo
	e5CXrLOT0V0rNwuU502htaIibmMJ3Ji0BOWhVHgXkG9gJyOHAThUPhEoS3alspI1Sxsywdvg3RT
	4xJPXPLncaIDrqJHxuarghHOR4Hl7mmWZczIoq1o7dcxke0ohff5rVUfvv1sfYX+Myk5w3ZBm0l
	eG0WWDj5WksPKWPRECvC8u08xCGA4c8mXnSZ+5I=
X-Google-Smtp-Source: AGHT+IGLzdEuk1QDPXYsF98Ye9BX9xDuqaq1bbiDW34OCl+7dp6Go4ivXszBVPBh1MuXNgGiw13DfA==
X-Received: by 2002:a7b:ce16:0:b0:43c:fabf:9146 with SMTP id 5b1f17b1804b1-43f4aafa80dmr77256645e9.17.1744722640535;
        Tue, 15 Apr 2025 06:10:40 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:357f:4855:d5d:eccb])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f233a2c46sm208119145e9.13.2025.04.15.06.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:10:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,  Ira Weiny
 <ira.weiny@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,  Stephen
 Boyd <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Danilo Krummrich
 <dakr@kernel.org>,  Conor Dooley <conor.dooley@microchip.com>,  Daire
 McNamara <daire.mcnamara@microchip.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Douglas Anderson <dianders@chromium.org>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
In-Reply-To: <2025041508-remix-plasma-cd47@gregkh> (Greg Kroah-Hartman's
	message of "Tue, 15 Apr 2025 14:59:30 +0200")
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
	<20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
	<2025021938-swan-facedown-e96a@gregkh>
	<1jecxtwpr4.fsf@starbuckisacylon.baylibre.com>
	<2025041508-remix-plasma-cd47@gregkh>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 15 Apr 2025 15:10:38 +0200
Message-ID: <1j8qo1woxd.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 15 Apr 2025 at 14:59, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Apr 15, 2025 at 02:52:47PM +0200, Jerome Brunet wrote:
>> On Wed 19 Feb 2025 at 15:20, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>> 
>> > On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
>> >> Add helper functions to create a device on the auxiliary bus.
>> >> 
>> >> This is meant for fairly simple usage of the auxiliary bus, to avoid having
>> >> the same code repeated in the different drivers.
>> >> 
>> >> Suggested-by: Stephen Boyd <sboyd@kernel.org>
>> >> Cc: Arnd Bergmann <arnd@arndb.de>
>> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> >
>> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> 
>> Hey Greg,
>> 
>> Do you need me to do something else on this topic ?
>
> I don't know what tree it is going through, do you?  If you want me to
> take in the driver-core tree, just let me know.

For patch #1, I think driver-core would be appropriate, unless there is
something more specific for the auxiliary device support ?

I'll wait for this sink into an rc1, then resubmit the different driver
changes to the appropriate tree, no rush.

>
> thanks,
>
> greg k-h

-- 
Jerome

