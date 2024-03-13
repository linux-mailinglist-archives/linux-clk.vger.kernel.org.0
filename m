Return-Path: <linux-clk+bounces-4544-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDD587B081
	for <lists+linux-clk@lfdr.de>; Wed, 13 Mar 2024 19:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 804A01C255C4
	for <lists+linux-clk@lfdr.de>; Wed, 13 Mar 2024 18:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9763913F45C;
	Wed, 13 Mar 2024 17:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YtilXYlL"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CCC13F452
	for <linux-clk@vger.kernel.org>; Wed, 13 Mar 2024 17:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710352437; cv=none; b=VoNDFuTc1K9M5yJ0yg5O/SccMainL2WKTWnzTFCpXvcsryCeQLn4UmXdUUDW8NAS/1qkIvrwAdBITPnVz/thsTJmPNRpeApBhJdL5KhWM9ILn0sJh72sDsNw7bOQ5aPGJ/sVbI1Qa5PJAERaRVz3yKu8jz+YrCkpLCD55xRySOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710352437; c=relaxed/simple;
	bh=m4MoUO1mvIPqt4fC1lB6nKiiGjCp4eGwXz6oqUc/OR0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WbCixnz795OAd6MtokVmvSqQWeZaWdz91vA9WaOQKtpViKuNRsWI2hk2trtqTZgnqfmrnXqSLeFWwwG7hZbAOGlFmYirSIP8tNMQV2s7Y2CDwIhklx3XyVjr9iXOaCnAePmvW1Han6I0ophVDei2ahGFky/gdEgNwEQHjZX6A+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YtilXYlL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-413ebcf13a5so638905e9.3
        for <linux-clk@vger.kernel.org>; Wed, 13 Mar 2024 10:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710352434; x=1710957234; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=izT/XW0GrmGVL6Tl66ecjkPXN9CJyhGJnGTtICjCD3M=;
        b=YtilXYlLZ883k/3wcu1/eYrS6FgOJOBJfTT34FcrCWVND4zDBllNsKYffjUUaZ3OoQ
         3U/BCFzqc+FQ4YPfFIMFBR9ZdnoFQA+5WSX/gRkhIGISb30IXHKZSFn21uR1LIaDoQvY
         3FpDM+aNiRTznYxitnKSEcCkP3ZGLSi/LDVjzMUQoqrPhbVTSs05ZOJFLtC7vF63CTUV
         OcugCGa62B1IyvOG6ppdQJ+cJ+C7kJyjnH4dIDlojuDaz+qrduBAUFSubRdccMg/OYPL
         crD/KZMJZUR4UXVAjElqNxSE14T3IKWkOkfSOgR9TNbMbYy25+SzzVxcI6w4RsMEYPkj
         tFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710352434; x=1710957234;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izT/XW0GrmGVL6Tl66ecjkPXN9CJyhGJnGTtICjCD3M=;
        b=dgplmSBn4AbtXPICzmMUNgCqi/CLfTJngmFgaB0k9wIoyTX8ac4SXra6YlgoefoF1r
         C6UdjSZg5AS0JsXzc4bZGpkJLfZLFuL0/EtJytj2xfsl8+jSzRCZMFaE0+XuMAeAgGF7
         1DYV/PobR1atwqefCHHbHwvkaAKfyDPGQpDWDCJkqM6KE1sAaJLP++LuNFyu17iaPfN4
         tMPlYLGR8tvWS0JIZlKnak6Sq0TT/g40ym6imudvSzjcck/FyqXqsQywiRn4zzDNCXiM
         6hkUkAiJng8M82d0+i7DimFoFLYirgmJOIvyyUhhVfzIzLigUXhOVPFyUlc3GTwNgqeb
         u46Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTdjXjMUNZSK3SGwTFgrvv5owa8kBhA3yKZM8HHq2VJJMc0SgWO7pXvIguqr0B47ZAANxGB0+5DpoVxLcsyVzLO4Nb6fdHxdvH
X-Gm-Message-State: AOJu0Yx+XAr2gxS2NTAz81B6jiYEQMV4CAGFMNHe6e1qWx7eg61XHJc9
	DZm0Ji4kmr0bvJYCsyfI85PIkDFBiWdyRGEy/HnL5zbj/lBsh023YiM9Gh1L0DA=
X-Google-Smtp-Source: AGHT+IHaKy+zzPYoBf25HdN7N6UQcsD5sQuS2StMY4WAgYUHdmUfCSSe9fFJKEDwU62nzkDMfpNiMA==
X-Received: by 2002:a05:600c:4e4b:b0:412:ed3f:1b4b with SMTP id e11-20020a05600c4e4b00b00412ed3f1b4bmr474221wmq.11.1710352434035;
        Wed, 13 Mar 2024 10:53:54 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id u12-20020a5d6acc000000b0033e7a499deasm9914482wrw.109.2024.03.13.10.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:53:53 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/2] qcom: clk: camcc: Fix power-domain definitions on
 x1e80100
Date: Wed, 13 Mar 2024 17:53:51 +0000
Message-Id: <20240313-linux-next-camcc-fixes-v2-0-9426da94ae37@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC/o8WUC/3WNSw6CMBCGr0Jm7ZjOgERceQ/DopYRJtHWtEgwh
 LtbSVy6/P7nAkmiSoJTsUCUSZMGn4F3BbjB+l5Qu8zAhitTksG7+teMXuYRnX04hzedJaGtjyV
 zQ3XFBLn8jLIZuXtpMw+axhDf289EX/U3Sf8mJ0KDHXFtxVyb8mDOOWhj2IfYQ7uu6weicQ7mv
 QAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13-dev-26615

There are two problems with the upstream camcc implementation at the
moment which this series addresses.

1. The camcc block has two power-domains MXC and MMCX however, the yaml
   description doesn't include MXC.

2. The code for the GDSC definitions for x1e80100 camcc fails to list
   the titan_top_gdsc as the parent GDSC of the other GDSCs.

This series addresses both of those bugs. There is currently no upstream
camcc dtsi for x1e80100 so the yaml change won't affect the ABI.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Changes in v2:
- Incorporates Krzysztof's comment on removing "phandle" description
- Added Konrad's RB
- Moves the location of the allOf
  Editing the dtsi to test the yaml constraints showed the power-domains
  were not being picked up but putting the allOf before the required
  fixed that.
- Listed the 8450, 8560 and 8280 under "-items" as testing shows
  adding too many power-domains to the dtsi was not being picked up by
  the automated checkers.
- Tested with
  Too many power-domains in sm8450
  Zero power-domains in 8550
  Too few power-domains in x1e80100
- Link to v1: https://lore.kernel.org/r/20240311-linux-next-camcc-fixes-v1-0-d126ae0b9350@linaro.org

---
Bryan O'Donoghue (2):
      dt-bindings: clock: qcom: Fix x1e80100 camcc power-domain declaration
      clk: qcom: camcc-x1e80100: Set titan_top_gdsc as the parent GDSC of subordinate GDSCs

 .../bindings/clock/qcom,sm8450-camcc.yaml          | 37 ++++++++++++++++++----
 drivers/clk/qcom/camcc-x1e80100.c                  |  7 ++++
 2 files changed, 38 insertions(+), 6 deletions(-)
---
base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
change-id: 20240310-linux-next-camcc-fixes-a68322916421

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


