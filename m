Return-Path: <linux-clk+bounces-9806-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BE3935136
	for <lists+linux-clk@lfdr.de>; Thu, 18 Jul 2024 19:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17B872856BA
	for <lists+linux-clk@lfdr.de>; Thu, 18 Jul 2024 17:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778CA14534A;
	Thu, 18 Jul 2024 17:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1F/IhVjz"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB868C06
	for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 17:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721323207; cv=none; b=U4A7qg1MdTyqeZN/BW+ZG8GX1E8mDk+/UBsoD55WeQL9I6b0enAsHLH3fT7s/NLljksnCCWBGJHBiTH+ODZlu497Sil+nO1ic0HXWXbM3I87QQ5Yju6qTE9YOOhxwdAwUW5krEaJXVI/fA1orik80ftjBfHVyL9Q/3Vdv7wvAyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721323207; c=relaxed/simple;
	bh=or0KWMw+hW1cJPDQYY2fZWLzTSZ73FjFZlNzmUyJ1GQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SKiCu3apSdyCwiWq9M7ywz2PUw28YJ/LukxYbS1OZmCZiV4mOlkTBAxtyLmptJuuyvxZmvhaPxKpKuozX1MaeZCxCCcNCZvRUpcX/Ku5nGh7WWpkVONsdodwDiynZKFM0xTEz2C43x7+KyeXv+qpx0teK7TWxLexvLDmP4zH1Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1F/IhVjz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-368712acb8dso46222f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 10:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721323204; x=1721928004; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=raklK+nWPF9tIVCfKyWj3FXF/Vo9avQJrD5r1/ljkPw=;
        b=1F/IhVjzhvEZQesukQRz6KDxx5ZGm6Wz1V1TiqOzhSJt1hVOp9Kqq4JKatgPKq/mzN
         QT5N18BydOYbIs6Q31z2p7TvWVxqOreoPzAyg+Vh2BPLUiVphlfr9kTIpnMQeLoXn9Cd
         nrow0dt2EmMy2DSN0/RjeTdkvHTdrru4gmqWL9TNCS5hiEOSe4ZJ1E/pFMbAFsVCrG+D
         GHlyZUAwwssY2kJrLFoAuyBE/gqaLvUo1712oZSYnv/ie1jLVRVzEPhVb4qGNm4V9ti/
         B2rf4h2kIbbw9CwfUm1kQGmd7LwK5UCa4evURiFYOsjnjCA54NBI4HCYyFks9qaOK78B
         jEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721323204; x=1721928004;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=raklK+nWPF9tIVCfKyWj3FXF/Vo9avQJrD5r1/ljkPw=;
        b=kRUD0JDbZ89vqqeIn1cbzYLjwnrXr0xuJXhwrj+JpYvRSIMiucpHcbrG/wz3O9hqND
         1YG7h1wV0yl1HyASaivJL5MuwGNp0KCyCiBU7OclmMM4PQHUpbQ99cGcq0hDJWpd8KRA
         KisnGDtrJmnUjg3JRBwZRjgLsiWHWHbT1K6ofK5i7yWdaBQ3W/SVHmYXaVWa/ScNAclE
         XYFurGdbon3bbunAXDneV0U3mODYIRV1yYx3PHuhAh4cabtmJuxIAZTCEG7g0fLyIGM9
         L6FpE6DzWV9YPjdCwrw0dQFnBZnkWLeaSAgB+UajEneUmyDxTwzI6wvPQJco39PJj/yX
         WCpg==
X-Forwarded-Encrypted: i=1; AJvYcCUKmUtmFW3reBL+I4+vJgqKpntXS+hPqW4N7oTbZzwJAyqlN5ofTggP4SzS2HJrRcMtGOq9B21IpUU3iNLTW0Qajnc1EDGCNi3z
X-Gm-Message-State: AOJu0YzFiHzw70xlqQ7E8O18ukwPkq6AgCjsXcYyGRbbFFzQfGrIue97
	pPNL9FRyt5XG6bX0MkC64qnU2uqNFQoRXHy5F4c2O3Zer2GPVowEFkVZZYK/P9s=
X-Google-Smtp-Source: AGHT+IEzUxzLEWSrQkAiFSgO8moaSXv2k0IxNFRMG+EkLW38PdnuAaPPdc63gHY5BK4R017qIX/IpA==
X-Received: by 2002:a5d:4b90:0:b0:368:6f19:cbf5 with SMTP id ffacd0b85a97d-3686f19d013mr357275f8f.31.1721323203853;
        Thu, 18 Jul 2024 10:20:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:bbf5:bf25:4f46:2ec8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36872855309sm155510f8f.82.2024.07.18.10.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 10:20:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,
  <linux-kernel@vger.kernel.org>,  <linux-amlogic@lists.infradead.org>,
  <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 0/9] reset: amlogic: move audio reset drivers out of CCF
In-Reply-To: <07b4e6b9-7448-45fb-b5a0-d069addb5dc2@salutedevices.com> (Jan
	Dakinevich's message of "Thu, 18 Jul 2024 17:20:32 +0300")
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
	<07b4e6b9-7448-45fb-b5a0-d069addb5dc2@salutedevices.com>
Date: Thu, 18 Jul 2024 19:20:02 +0200
Message-ID: <1jmsmemxbx.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 18 Jul 2024 at 17:20, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> In previous series there was a patch "[PATCH 8/8] clk: amlogic:
> axg-audio: use the auxiliary reset driver", but I don't see it here. Did
> you removed it, or I missed something?

It is meant for another tree and will be sent seperately

>
>
> On 7/18/24 12:57, Jerome Brunet wrote:
>> This patchset follows the discussion about having reset driver in the
>> clock tree [1]. Ideally those should reside in the reset part of tree.
>> 
>> Also the code of the amlogic reset driver is very similar between the 2
>> trees and could use the same driver code.
>> 
>> This patcheset alignes the reset drivers present in the reset and clock
>> then adds support for the reset driver of audio clock controller found in
>> the  g12 and sm1 SoC family to the reset tree, using the auxiliary bus.
>> 
>> The infrastructure put in place is meant to be generic enough so we may
>> eventually also move the reset drivers in the meson8b and aoclk clock
>> controllers.
>> 
>> Changes since v1 [3]:
>>  * Fixes formatting errors reported by Stephen.
>>  * Changed parameters type to unsigned
>>  * Fix usage of ops passed as parameters, previously ignored.
>>  * Return 0 instead of an error if reset support is absent
>>    to properly decouple from the clock and have a weak
>>    dependency
>>  * Split the platform and auxiliary modules in 2 distinct modules
>>    to fix the COMPILE_TEST error reported by ktest robot.
>> 
>> Change since RFC [2]:
>>  * Move the aux registration helper out of clock too.
>> 
>> [1] https://lore.kernel.org/linux-clk/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org
>> [2] https://lore.kernel.org/linux-clk/20240516150842.705844-1-jbrunet@baylibre.com
>> [3] https://lore.kernel.org/linux-clk/20240710162526.2341399-1-jbrunet@baylibre.com
>> 
>> Jerome Brunet (9):
>>   reset: amlogic: convert driver to regmap
>>   reset: amlogic: use generic data matching function
>>   reset: amlogic: make parameters unsigned
>>   reset: amlogic: add driver parameters
>>   reset: amlogic: use reset number instead of register count
>>   reset: amlogic: add reset status support
>>   reset: amlogic: move drivers to a dedicated directory
>>   reset: amlogic: split the device core and platform probe
>>   reset: amlogic: add auxiliary reset driver support
>> 
>>  drivers/reset/Kconfig                         |  15 +-
>>  drivers/reset/Makefile                        |   3 +-
>>  drivers/reset/amlogic/Kconfig                 |  27 ++++
>>  drivers/reset/amlogic/Makefile                |   4 +
>>  .../{ => amlogic}/reset-meson-audio-arb.c     |   0
>>  drivers/reset/amlogic/reset-meson-aux.c       | 136 ++++++++++++++++
>>  drivers/reset/amlogic/reset-meson-core.c      | 140 ++++++++++++++++
>>  drivers/reset/amlogic/reset-meson-pltf.c      |  95 +++++++++++
>>  drivers/reset/amlogic/reset-meson.h           |  28 ++++
>>  drivers/reset/reset-meson.c                   | 153 ------------------
>>  include/soc/amlogic/meson-auxiliary-reset.h   |  23 +++
>>  11 files changed, 455 insertions(+), 169 deletions(-)
>>  create mode 100644 drivers/reset/amlogic/Kconfig
>>  create mode 100644 drivers/reset/amlogic/Makefile
>>  rename drivers/reset/{ => amlogic}/reset-meson-audio-arb.c (100%)
>>  create mode 100644 drivers/reset/amlogic/reset-meson-aux.c
>>  create mode 100644 drivers/reset/amlogic/reset-meson-core.c
>>  create mode 100644 drivers/reset/amlogic/reset-meson-pltf.c
>>  create mode 100644 drivers/reset/amlogic/reset-meson.h
>>  delete mode 100644 drivers/reset/reset-meson.c
>>  create mode 100644 include/soc/amlogic/meson-auxiliary-reset.h
>> 

-- 
Jerome

