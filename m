Return-Path: <linux-clk+bounces-7907-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A60AA901F0F
	for <lists+linux-clk@lfdr.de>; Mon, 10 Jun 2024 12:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D25AB29014
	for <lists+linux-clk@lfdr.de>; Mon, 10 Jun 2024 10:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5CD77F1B;
	Mon, 10 Jun 2024 10:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2viRkphC"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A5A77113
	for <linux-clk@vger.kernel.org>; Mon, 10 Jun 2024 10:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718014425; cv=none; b=gX2MIsQ5qERPfqwQEQRwqnhvyan5+UCSZo9aF4qb5WLrPUicUKXpENais/NJ+k3/PG1Vta5g0TKOFU4ArLDkgqevtqBOaxOtxLq6yLMSJj8R5lAmp7OnFMkiKGWk4K2pQciKg/JRApx8O1u7iO6CmcsaUIdAvTmHueu7tT31yrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718014425; c=relaxed/simple;
	bh=hgx2T9kylilWsH1G1Hk710ItCP12Cz3Ph1mFoLPeyWc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CrYxgV3yq+/jbdX6sMJjH5JRqg/1YWTiJ3NXgQesyC4lbV6X2iuMctA6i0gae0h792xtk7qM+gCOEJvQVniNc1seuH8gG+qzCnYoPGoMldRdLaqvJdCkNEkGJXL/Vyg8DPPhxXZGuklIv3pJQvIbW77Sp1u6dOKw3Dwtw1RT3XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2viRkphC; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-356c4e926a3so3921776f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Jun 2024 03:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718014422; x=1718619222; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hgx2T9kylilWsH1G1Hk710ItCP12Cz3Ph1mFoLPeyWc=;
        b=2viRkphC877u/OoBcaiPi4r2CmfPGaSyO7jTaD5BgCFpj6X6sjiukveOi/lkBrdqAK
         KGqKnRPBYG55VP3eMXW1WaOHd6ejfhYnEdlkKxdf0ESF2pDfNctEDhMwASZ3C3XytNAW
         9F+h98540K8udA+4YBlDp4PaLiVTGfYRilat8xYHleM7X3OmGuJgLM1sUTxZHBsUuX4O
         UUboxKrxzIp8meWJ/TMZsxJC0e3PRgZjp9yPKnGid5elIQk13Wb2LK8R8wzcuFsZJKAm
         jpgYXTojbaumhAyRYn2AvTIjetJg2EjExO2TiqsMa6IbREWwhXTZnJxinx+AHZeGaomQ
         Cb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718014422; x=1718619222;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgx2T9kylilWsH1G1Hk710ItCP12Cz3Ph1mFoLPeyWc=;
        b=gNCn9NXh8ni08UAIHX0XQqQt7b3doyLsLDfY2RLJx+1w/rrCmCUSCxrd8n8vxXIs1L
         2v6lUKYdCNiMbFv2B3amC7XmGftWN5Vw8PiMArvEsDIY1y2ko9ywocFFQ958Czc5UaVf
         esmvZHa5tbiNvRnaXt0lmWZMhpGnieEsxfDH1v5ccf/LOn3UESZS7AhAesvGQOw+yNUi
         Nb71GD568s7mkAkApSAHMn5CgGVixYuxj9JmkSzmhmNUUgxJD87MtATXwjAHHX5IfJ3M
         E5T4uD9Ixf7N0FwjJlUzHTLj9XPNVpECLaHvPwyxo3Ko7PO8+7CPcVsZK1OqOPiPr2Bq
         CMCw==
X-Forwarded-Encrypted: i=1; AJvYcCXgLpobTRdTlqjclSxxaFJes8hBZp4R0fT1atTtskVnEU5Jp57JNRt0/9ISjgyZJNOlqGe9luLiq2x8s8aub7PWAjAAH2ixrtCi
X-Gm-Message-State: AOJu0YwbDMJy+h6cWinsBJxdFBQC6NCUv1Z2C77dhcwx887Ml+/cE/u1
	KRN4SmOq+WUps2NwwYf86IT5ds2qk7IVfG/xERV00tcw41skaYa+kVix+zMpk/c=
X-Google-Smtp-Source: AGHT+IGgeOOdto077Okd7vLn2j1OX9iKBjMp6WWe5i6+dhSZlAdwPE+HQyeM0KQew5XncDF0WV2dlQ==
X-Received: by 2002:a5d:47a2:0:b0:35f:2550:e276 with SMTP id ffacd0b85a97d-35f2550e366mr1516821f8f.5.1718014422196;
        Mon, 10 Jun 2024 03:13:42 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:afd3:66ee:5486:4249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f24ebfbbbsm2136085f8f.61.2024.06.10.03.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 03:13:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: <neil.armstrong@linaro.org>,  <mturquette@baylibre.com>,
  <sboyd@kernel.org>,  <robh+dt@kernel.org>,
  <krzysztof.kozlowski+dt@linaro.org>,  <khilman@baylibre.com>,
  <martin.blumenstingl@googlemail.com>,  <jian.hu@amlogic.com>,
  <kernel@sberdevices.ru>,  <rockosov@gmail.com>,
  <linux-amlogic@lists.infradead.org>,  <linux-clk@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 0/7] clk: meson: introduce Amlogic A1 SoC Family CPU
 clock controller driver
In-Reply-To: <20240515185103.20256-1-ddrokosov@salutedevices.com> (Dmitry
	Rokosov's message of "Wed, 15 May 2024 21:47:23 +0300")
References: <20240515185103.20256-1-ddrokosov@salutedevices.com>
Date: Mon, 10 Jun 2024 12:13:41 +0200
Message-ID: <1jed95p0kq.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 15 May 2024 at 21:47, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> The CPU clock controller plays a general role in the Amlogic A1 SoC
> family by generating CPU clocks. As an APB slave module, it offers the
> capability to inherit the CPU clock from two sources: the internal fixed
> clock known as 'cpu fixed clock' and the external input provided by the
> A1 PLL clock controller, referred to as 'syspll'.
>
> It is important for the driver to handle the cpu_clk rate switching
> effectively by transitioning to the CPU fixed clock to avoid any
> potential execution freezes.
>

Please group your changes, fixes then bindings then driver.

