Return-Path: <linux-clk+bounces-3351-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C2784BD13
	for <lists+linux-clk@lfdr.de>; Tue,  6 Feb 2024 19:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BD891C22EA7
	for <lists+linux-clk@lfdr.de>; Tue,  6 Feb 2024 18:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB8D6FA9;
	Tue,  6 Feb 2024 18:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jW569ETY"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEC813FEE
	for <linux-clk@vger.kernel.org>; Tue,  6 Feb 2024 18:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707245022; cv=none; b=FiuV31B+dn9zlg6l11Lo4wV4aNMlUnYHaV8R9QRWhwKYPlEv1QPCPzchPXF3hNJDrLCVaz10adnnS0GCKB8koSIiXt41ygBsI/c58MCkcD3zLNLYrs8b/wa4fqrf7Jex6EnNgU0+kcTN43KxnCvGXgcxTXV4KDnpc8ts0hGVZYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707245022; c=relaxed/simple;
	bh=yDmruuQF6fFZAPlSNaL/m0BOFTSsJrnucEdwAIP0S64=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SC4c4pBBp/XWTMFDME13BVnEOgkUb9gtUM+5eAdfRgMUcW1dAOl0aJb/UAVCSQO+r8Hy13onlSrPmzCNJx8cBHOuXaAWSqzZotraKsGhEwKDT9A+TqtiOZIgpMwLHUCHdNK6GQBVb6ohscn8LTaOZGDHV50b95qxiQDoP7M9F+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jW569ETY; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a36126ee41eso757379366b.2
        for <linux-clk@vger.kernel.org>; Tue, 06 Feb 2024 10:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707245019; x=1707849819; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EPinIhB5nRjoZSkHxrPck/Req/gZMo5duEbps1JKDSE=;
        b=jW569ETYOI82jKAh+40VLkeasraAPYhJ70IlaX3XWRoHl7/aHNyxAh+uXhhch+Jp1C
         2dQfDkDW/isjgVyX+/6Q/jJMtltIuZC1/BccmOnt5trM/XhJqPfUS13sJSDdopp71aw9
         zn4jHVpbKQPsbOC8DXSsx7Dm2igooIpPnZMl0NsBtAiS8U7F4J8EKgHm3mK4F1JvfL4E
         hjxmT2pDzrxms6dGalzIu+qYfD4LNj2eHO7srO9TZKR8GZu4MrvDyCr815gMipsrhx4/
         PH624U9LSEJIelz6/RABk35gm3L8gd2vINKQfTyhjbvNKUg3+Bim3uV7BNdqhgCUC5hw
         yZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245019; x=1707849819;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPinIhB5nRjoZSkHxrPck/Req/gZMo5duEbps1JKDSE=;
        b=Cy5OQhwZa/54mO3ZMp+v1KCx/FBFZqtOu44uHVa/s+Yq1KF9x/94oT6+evPQUCQ3Yp
         wylCFGZdIxoXHc8k1V8qJb3rJypNqWLR5nSUHnRhHMpLdhBwVgi+2ufcCVGr47+2LDpJ
         X0t4ZVb/k/7LuddHy/sh2YVDYhljbKBzQF7XQr6dwuaQhWMKLcethifBdPO+mBdZnKrY
         nKlkwgLuBbQczlbqO0vZccX4wnd13tAvBzk032Qssjvx4uWw1gPeeeyUuYpVFy5Pdynj
         cLgLS9sK0q3PS6J7VlIJ3JghyEja7qzHazE6JEd3CVxw9hhOSTytQ1XHfEG434AtZOA9
         4LIQ==
X-Gm-Message-State: AOJu0Yz67i9/0LLpxKohOrsnciiIJTrnFW2piZZGxaT+pyqlhwXJaeVs
	aOdxsVqf6kB5FCd+0L5Mvt8E2PRRZGdwuN6FSZdrbNxbYKj8f/F2nz2woaS8NOU=
X-Google-Smtp-Source: AGHT+IG69MWyI/fNP1oAOlGJFsc3y7aOqQvZFe/yNI+O+DjRzhvBz+gVC2ZHAkmswNLc8nBo1PKTeg==
X-Received: by 2002:a17:907:7898:b0:a38:4365:a5c5 with SMTP id ku24-20020a170907789800b00a384365a5c5mr1089191ejc.13.1707245018845;
        Tue, 06 Feb 2024 10:43:38 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVLGmVoMO+w58EzIO+EO7SbiXNGlwA2UmjJbT7sNcUNolDUXewVSnGu52rgkDcgkwr1Vw14cdfGLsHWJvtaAQFny7RglViQwkHmCa/4vPP/GeX4vNygg7Nsz4aVGjbGVSWVd7ljMlIayQA/I4dIRnH15dtF6MldOFNKuXH4cYOAns6BftYFTcbYp0yUQyl+/K6nvEs1XYsl9BAeh6uIPSzBlTjoHEfRaUBCuqoJNZt5bwP5mdBUJ7R7a6d6FuNpcm0qnswXDVkIWMMzYCxnMDb25AA4pF9VN/q1ePLH2dbU3MdsIHXDo3Ga0kzlSaBsfEY2itOy9VJ91w2UdUL7O5UmN7IHcUY6VJHW/brKXPkobuIR6IwytA9x+r84uO7I0xtO/UKiQ9sxg+3Sb7p2jXfvK4QgA2/Mvr045sz2ksPRyHqRkoeu+VMerP+IuKsV5wEn0aRY/nCo
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a384365e3b9sm562305ejc.195.2024.02.06.10.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:43:38 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 00/18] Qualcomm GCC/VIDEOCC reset overhaul for Venus
Date: Tue, 06 Feb 2024 19:43:33 +0100
Message-Id: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANV9wmUC/32NQQqDMBAAv1Jy7pYkGLU99R9FSpKuuiCJbDS0i
 H9v6gN6nIFhNpGQCZO4nTbBmClRDAX0+ST8aMOAQK/CQktdSSUNLHEmDxnDmp6MCRdwpqqV65W
 VbSNK52xCcGyDH0sZ1mkqcmbs6X2MHl3hkdIS+XN8s/rZf4usQMK1Vb6xta5aY+4TBcvxEnkQ3
 b7vX25arlHIAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707245017; l=2858;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yDmruuQF6fFZAPlSNaL/m0BOFTSsJrnucEdwAIP0S64=;
 b=HtYYLU6J5DdnzEQhJpjXJ/NVyentVHNiW9ifCXBv3p88W/6LDStzzyYaqd1AvhujA1ojoVXjx
 r75ifKSJiPlCz/eSsWiM2vkFL6/CcHnwH7op2UDAKUy75iIqDJ/Co8R
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some resets associated with venus require a larger delay for the hardware
on the other end to function properly. These seem to fall into three
categories:

- 150us for 8250 and earlier
- 400us for 8350 and friends
- 1000us for >=8450

Make some housecleaning changes and describe these delays in preparation
to moving this data out of the venus driver.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Wrap the function parameters in patch 2
- Better describe the sources of reset delay values
- Pick up tags, rebase (with no changes)
- Link to v1: https://lore.kernel.org/r/20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org

---
Konrad Dybcio (18):
      clk: qcom: reset: Increase max reset delay
      clk: qcom: reset: Commonize the de/assert functions
      clk: qcom: reset: Ensure write completion on reset de/assertion
      clk: qcom: gcc-sa8775p: Set delay for Venus CLK resets
      clk: qcom: gcc-sc8180x: Set delay for Venus CLK resets
      clk: qcom: gcc-sc8280xp: Set delay for Venus CLK resets
      clk: qcom: gcc-sm4450: Set delay for Venus CLK resets
      clk: qcom: gcc-sm7150: Set delay for Venus CLK resets
      clk: qcom: gcc-sm8250: Set delay for Venus CLK resets
      clk: qcom: gcc-sm8350: Set delay for Venus CLK resets
      clk: qcom: gcc-sm8450: Set delay for Venus CLK resets
      clk: qcom: gcc-sm8550: Set delay for Venus CLK resets
      clk: qcom: gcc-sm8650: Set delay for Venus CLK resets
      clk: qcom: videocc-sm8150: Set delay for Venus CLK resets
      clk: qcom: videocc-sm8250: Set delay for Venus CLK resets
      clk: qcom: videocc-sm8350: Set delay for Venus CLK resets
      clk: qcom: videocc-sm8450: Set delay for Venus CLK resets
      clk: qcom: videocc-sm8550: Set delay for Venus CLK resets

 drivers/clk/qcom/gcc-sa8775p.c    |  4 ++--
 drivers/clk/qcom/gcc-sc8180x.c    |  6 +++---
 drivers/clk/qcom/gcc-sc8280xp.c   |  4 ++--
 drivers/clk/qcom/gcc-sm4450.c     |  4 ++--
 drivers/clk/qcom/gcc-sm7150.c     |  2 +-
 drivers/clk/qcom/gcc-sm8250.c     |  4 ++--
 drivers/clk/qcom/gcc-sm8350.c     |  4 ++--
 drivers/clk/qcom/gcc-sm8450.c     |  4 ++--
 drivers/clk/qcom/gcc-sm8550.c     |  4 ++--
 drivers/clk/qcom/gcc-sm8650.c     |  4 ++--
 drivers/clk/qcom/reset.c          | 27 ++++++++++++++-------------
 drivers/clk/qcom/reset.h          |  2 +-
 drivers/clk/qcom/videocc-sm8150.c |  2 +-
 drivers/clk/qcom/videocc-sm8250.c |  4 ++--
 drivers/clk/qcom/videocc-sm8350.c |  4 ++--
 drivers/clk/qcom/videocc-sm8450.c |  4 ++--
 drivers/clk/qcom/videocc-sm8550.c |  4 ++--
 17 files changed, 44 insertions(+), 43 deletions(-)
---
base-commit: ac139fc7db67968e5061715508b5fc4aa7c40c56
change-id: 20240105-topic-venus_reset-b5461bf1a087

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


