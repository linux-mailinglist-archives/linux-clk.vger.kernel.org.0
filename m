Return-Path: <linux-clk+bounces-4504-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8289D877954
	for <lists+linux-clk@lfdr.de>; Mon, 11 Mar 2024 01:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EEA528144F
	for <lists+linux-clk@lfdr.de>; Mon, 11 Mar 2024 00:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE050138C;
	Mon, 11 Mar 2024 00:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G06A5gyO"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D6A394
	for <linux-clk@vger.kernel.org>; Mon, 11 Mar 2024 00:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710117211; cv=none; b=FLGWbXM5ZbGifcKwmDGMgMMeZnMWf+Do/5rcXHcM0+ixU7B4B85DvnE+qhkHTzkwhQ4KoGuE4YXGdUVk9dlXwPRQ/3/BTjDVzd2zyxfykAlJtsu87ZYYtBxzxpOsyo4QaeSv+yxReOFYKp/UOF1qlIorULHNEyvBu6b6hTGTaNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710117211; c=relaxed/simple;
	bh=q3MFamMIr6NFVpUFcDH0jWX4vsZYOAYFx1MyZtEqvyw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B1PmFHOEgfN4wpDScemMVCmGoMvaEZrRdjhwgHNnXnqzeenaseD8VgqIBPgq7kWVoz2QHa0CUYuy3hJF28RHn4WrrxPRaNG90FSKJQGD29QUfdNOiaee/OhrjMjWNKPHNf4IqX2+Kvvbe0cGNZHSBviRuBzkIU81Nax46t1aonU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G06A5gyO; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33e98610a6dso113395f8f.2
        for <linux-clk@vger.kernel.org>; Sun, 10 Mar 2024 17:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710117207; x=1710722007; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mfyiNRPXIKA0wIGpSVJEarVeJ6YjuAYZ6W8XU9TBWZg=;
        b=G06A5gyOSWhOCdfOvpciP7O2FLtr30VEiftt/DxtYfV14qmKq7XDpfFAEJnhtoUH2Y
         RTF8Y1mVo6eMhN6ONniokvzIb7h1tdEIf3+8KAyxdmoD9zlJ81WPOzcJUlsOQup71Llh
         SO04Nn+77qKjtPZD91xoBFL4CAKgJCaE0phv3vxhmlzck09GpfkZgZSSKOcC2vWGCv9m
         kCA8HcwikSpbcyQsjPfFCGu3S2jQOJqP/ag1CdcwFCI/DmqS99t5s+i+/sIRDwwCCv97
         rrx5WeeXQglQznyprjrrFZXIN4sP8MTMvt8x0n96iRW6HWnOvf8wPgXiOmxB9bTnm6wf
         t2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710117207; x=1710722007;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfyiNRPXIKA0wIGpSVJEarVeJ6YjuAYZ6W8XU9TBWZg=;
        b=ZkZvqDqgUFQ/wEFr1yllxe1oZC83J9907B0FXy82ad9uzJQe8vsV5BbRDLMpMHcqtE
         y9UIuYNNlXx2CrItGVbIpw9ROcyLW/hZJPnNsOkoMLrnK2oTXnUyw3OZjamTwTxIyEXz
         SuKXkbcSwsITC8f7LopwRaYUpf1M/AmS/QsKysBdolQnlfrRUy9vJFfQoKWYesyGbgtZ
         TgNmJUycfHJv5c5RJUij1wm7LiJ+is5ez/YwcmUR/DSkYssFZ9GKeHCXvU0UAjAhbuso
         51RRxVWmILV/x1N5T62svHDAeGwbKz5daiZzA7z3NQjKm055ZtxNo+oaYRDZGISC5wyd
         03fg==
X-Forwarded-Encrypted: i=1; AJvYcCXB1zTFmVOYES74PPG2rXkw3MoRCYtcbV2VluuJLmcEX4LrMjOC4M+ep3cbIpzVT/zxu6QjnIBhEXm4gkUQB/t0p4OjSyve1W4/
X-Gm-Message-State: AOJu0Yx1hkX1e6uJVTpQN6kWSAwcnGHGIvjlVsYG4840NBR0JKeKRtUs
	6fYnOXN3inWPXnWNVjkWwCTflZzF86NnOCJ3fIIOYzYvlCjMsXLfUmtA5Ealu8o=
X-Google-Smtp-Source: AGHT+IFwRUunT+Ya9ZAsaCyFZIIhiHE6ops/oFZR1frJlejjxGjqW5MNXAD/9FWboTVWVIXp+oDlPA==
X-Received: by 2002:a05:600c:1d86:b0:412:f8c2:869a with SMTP id p6-20020a05600c1d8600b00412f8c2869amr4095684wms.30.1710117207063;
        Sun, 10 Mar 2024 17:33:27 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id m38-20020a05600c3b2600b00412b6fbb9b5sm13881720wms.8.2024.03.10.17.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 17:33:26 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/2] qcom: clk: camcc: Fix power-domain definitions on
 x1e80100
Date: Mon, 11 Mar 2024 00:33:24 +0000
Message-Id: <20240311-linux-next-camcc-fixes-v1-0-d126ae0b9350@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFRR7mUC/x3LQQqAIBBA0avErBvQMaK6SrQQm2qgLLRCiO6et
 Hx8/gORg3CErngg8C1Rdp+hywLcYv3MKGM2kKJKGa1wFX8l9JxOdHZzDidJHNHWjSFqdV2Rhjw
 fgf+Q33543w9RZaGpaAAAAA==
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


