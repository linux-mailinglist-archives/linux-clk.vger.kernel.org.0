Return-Path: <linux-clk+bounces-1457-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C03938136B8
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 17:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6962D1F22092
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 16:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5388A5F1D8;
	Thu, 14 Dec 2023 16:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mOAGoNiw"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65B8711A
	for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 08:50:00 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54cd2281ccbso10786883a12.2
        for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 08:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702572599; x=1703177399; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yBhzbmAj67WH53W1wvQDKaWskYMMj2BHh/tnbYgx8HA=;
        b=mOAGoNiwOHxsd8JB+n9ovqwYriBIEUBbqg9vqq3SCFrNBoZtTDv+HJvOZSZv7Pbj+X
         rvBtXZMpTZoXyJsFLwhCSijebGqxz1std20Ge6QqEh+5A6y3cS+SW4o9A8wejp3CPToh
         a3r16lmddrrJICgPbtUjWUORcbQ53nSEPD1ijohQfk1ZzvSVZcdUU7nGopzmJsSeuIFx
         tkmUO0vcbarDwrIv+FnDhMDDTKa6w8vr/fxoUu8yHx4Feo19D3aKrvWOMirQ2sy9Fn04
         rItLmfNk2xGmq2A27lCtvbaiCQdj5RD6yn/Ek+5E9AuEwOl3/gQT/yjQAQ4o/6xsbiLG
         EGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702572599; x=1703177399;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBhzbmAj67WH53W1wvQDKaWskYMMj2BHh/tnbYgx8HA=;
        b=t5agU72XQDMmrQSXOtX+W1SZu2wnDzZ89n6Tm6Q62l0ov5Pm/Tc+Mo3br/XvyXd9/z
         fnkN9KsYuqDZ0XxBcWlqafPmFjp33hfCGjP1A3tG7yjsiCUe0dRgNWuGTk/PxZZPQ2Vu
         SDxPQsO1vnurNvn2zM9Jl+qvAm3Exx8cuHEptsUOxWeLY1aF71UD73t1WBBCjZAw6HQ6
         0u1XOVya//crCZL1DcUNsRBwbZVuaHafUVWLtYIkIlhAKZmBF/0pmNNeMkSruzMrdd4i
         YF+M50HtVpY++ArvaIdTzSZ/gBcDEwDsPfEojP3Olj3x1hs8Sd8Vs40Yb/m8L5MFELzf
         KQAA==
X-Gm-Message-State: AOJu0Yw5BVhiGhe9l7W2uLaLxcEgFHTJ5M/VmPwYWmgLzLc/pt56ZXi5
	PmBQBdDgtkmUaPdQOSpgybpdFA==
X-Google-Smtp-Source: AGHT+IEvlVXD+BSI5/aZy9yOj/uDy7WD6GyGewOVWoXdC/Vg7Bjyvvpaal1WJyslGbxYqdbpy2OG8Q==
X-Received: by 2002:a17:906:cf99:b0:a1b:d9d4:26db with SMTP id um25-20020a170906cf9900b00a1bd9d426dbmr5302654ejb.124.1702572598826;
        Thu, 14 Dec 2023 08:49:58 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id tn9-20020a170907c40900b00a1f7ab65d3fsm8530308ejc.131.2023.12.14.08.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:49:58 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 00/10] clk: qcom: Add TCSR, GPU, CAM and DISP clock
 controllers for X1E80100
Date: Thu, 14 Dec 2023 18:49:29 +0200
Message-Id: <20231214-x1e80100-clock-controllers-v2-0-2b0739bebd27@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABoye2UC/32OwQ6CMBBEf8X07GpbIBJP/ofh0JYFGpuu2TYEQ
 /h3AY1Hj28mM3mzSMgek7geZsE4+uQprqCPB+EGE3sE364stNSF0lLBpLCWSkpwgdwDHMXMFAJ
 yAmtKbWV1qbraiPXAmoRg2UQ3bBe2PP/Gn4ooQyZIA4awDZ6MnZ92m3uz8uBTJn7tcqPa0q+H0
 v88RgUSZIvKdGXZOlvcgo+G6UTci2ZZljf8YecQ9gAAAA==
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2719; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=fDc7jNsxXmWiN6uOG3HqR3oI5jwPPS7PFpI2HpA1eCo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlezIhJL1X51PSlMCB0E3W8d+cHeusP/x4jN51a
 Pu/aDtizFSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXsyIQAKCRAbX0TJAJUV
 Vjl9D/sG1Ocp0l6Q0S9oWZ6AX/EIqzpnywTOTbr//TLLXg89UBDvLspficbZYaxDZIyf1S3GLyt
 p2aMsrilQWxGv+0DEvVzZpPnJ9bSSy/PJI4KzVtddidEo+aj3seZURcME/9UyMtvFI+/ANpGNaP
 P3Ao1ttqmcV9GzZ895vs918GzAiKRzgW9OorlKf9/6sXJ7spXEmlfpMSq7bVPlcXrTJUhuQxzsL
 3+ivzQQiMLZSfKrt9mp5y5s4b+2On5Ua/qqTOo+koCYU/ntrx729PvyxyjWbLjugq6t4nSd4/Jg
 OMXKTLf/iwR1VMUODn7cC5dSx7y3kp2Zfp4YLWOEdtwnO/HxJGU0s8LimUOQ11Y7w4AbKjSVP4Z
 QR8SZVq2q86hSYFplVZBvD7J9y2jLpkSKB0rCxECNAJnFwoegeAp6fUYSqCDXYAtpP0qmdyW+IU
 roybwyr2U4vKkuWUiazFcexXhzSrH43oUvGnw7t2V04LN8vV0VwVAID10oVO6arU9Rv3EazLfJ1
 2kCaLJyIoA3VUpGFdinlUM/lQ87j5NKcsSBd75rghyAiuq3H8GTwj79CdWVu88+7uiGsCqGk1ts
 BY5Y2BWrg6iYJBdfJB5ibDnZf0G3MCxWpkee4mW0l8RoQAEzom0nLKrRhI1MlAJK2s31kg5wTwF
 qM2KZq+JoNmy05A==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

This patchset adds all the missing clock controllers for Qualcomm X1E80100
platform. Another important change is the dropping of the dedicated
schema of the SM8650 DISP CC as a preparatory work for documenting the
DISP CC compatible for X1E801800.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Added Krzysztof's R-b tag to patches no. 1, 3, 4 and 5
- Added Dmitry's R-b tag to patch 7
- Reordered Signed-off-by tags in patch 6
- Lower-cased hex values in patch 6, 8 and 10
- Link to v1: https://lore.kernel.org/r/20231212-x1e80100-clock-controllers-v1-0-0de1af44dcb3@linaro.org

---
Abel Vesa (3):
      dt-bindings: clock: Drop the SM8650 DISPCC dedicated schema
      dt-bindings: clock: qcom: Document the X1E80100 TCSR Clock Controller
      clk: qcom: Add TCSR clock driver for x1e80100

Rajendra Nayak (7):
      dt-bindings: clock: qcom: Document the X1E80100 Display Clock Controller
      dt-bindings: clock: qcom: Document the X1E80100 GPU Clock Controller
      dt-bindings: clock: qcom: Document the X1E80100 Camera Clock Controller
      clk: qcom: clk-alpha-pll: Add support for zonda ole pll configure
      clk: qcom: Add dispcc clock driver for x1e80100
      clk: qcom: Add GPU clock driver for x1e80100
      clk: qcom: Add camcc clock driver for x1e80100

 .../bindings/clock/qcom,sm8450-camcc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    7 +-
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    1 +
 .../bindings/clock/qcom,sm8650-dispcc.yaml         |  106 -
 drivers/clk/qcom/Kconfig                           |   35 +
 drivers/clk/qcom/Makefile                          |    4 +
 drivers/clk/qcom/camcc-x1e80100.c                  | 2489 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   26 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    4 +
 drivers/clk/qcom/dispcc-x1e80100.c                 | 1699 +++++++++++++
 drivers/clk/qcom/gpucc-x1e80100.c                  |  659 ++++++
 drivers/clk/qcom/tcsrcc-x1e80100.c                 |  285 +++
 include/dt-bindings/clock/qcom,x1e80100-camcc.h    |  135 ++
 include/dt-bindings/clock/qcom,x1e80100-dispcc.h   |   98 +
 include/dt-bindings/clock/qcom,x1e80100-gpucc.h    |   41 +
 include/dt-bindings/clock/qcom,x1e80100-tcsr.h     |   23 +
 include/dt-bindings/reset/qcom,x1e80100-gpucc.h    |   19 +
 18 files changed, 5528 insertions(+), 107 deletions(-)
---
base-commit: 7b0e611dc474ffa67d3a6ea235085bf423ee5f2a
change-id: 20231201-x1e80100-clock-controllers-ba42b0575f8a

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


