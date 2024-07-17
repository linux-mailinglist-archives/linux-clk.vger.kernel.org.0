Return-Path: <linux-clk+bounces-9728-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF95933AAA
	for <lists+linux-clk@lfdr.de>; Wed, 17 Jul 2024 12:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 635821C2091A
	for <lists+linux-clk@lfdr.de>; Wed, 17 Jul 2024 10:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C3617E90E;
	Wed, 17 Jul 2024 10:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aAJkbd7o"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E80014B07E
	for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 10:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721210675; cv=none; b=XypgFixYfqwnEs2cDrCd9wznwlgXflZ/d+8MnhEwVFRjp2jssCAuf6I49kUjK07sGkY+hBY8yOkLTUcNMzyvLOHHKqXtYAGfxSHsmPcNo7PIOBeMEOeiu4qsgXAlbWFL52zyuS3Jgw6GuQDzeJEw1baiwZKdMtWifscCuLHP3H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721210675; c=relaxed/simple;
	bh=uv0ykO6lAHanu2zHRfaeWFxF3b1Xl5H0N7x9oqBBQPk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h15nFwBcuUVXVRWnSiv8KbeoB4ZhoF85HrLyylT791Vik+M1cruK3YdMHwvc70lkq5tqTqfvRFkuaGL8BYgmNFjbw5kZz8P/EkouNSFq1O/QAce6UZNZXJHb7+luc2uNbq8N9TKcDWR2H7bwm4ySEw9ALKIhdaKgS7x2Pgt3rtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aAJkbd7o; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ed741fe46so3903511e87.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 03:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721210672; x=1721815472; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Dem9Aalm2RNMnEUQEEPY+XPaS5++v2y4aGes9SF7kc=;
        b=aAJkbd7oCVgbBWZ1zmu5mtnD/GK72yBCDsULzTvsNOA+gsshiXzYvQ8hbR/y+zBqMr
         iPHFK7nuliMkT9oCrOejyrN6wiF8cZP5q/Qv/Fw2iboXtOS7tRMBgeoQgOIkcv5Hl+5f
         tNTVbqLva4cgIJwnTm0jj7Fr4L1K+/rRzNtRmls3XUayhnwis1NoXH/46wI3FvbKHxSY
         EDxCe4k10IDYZoKwTG52l72MwCTWW6cS7k+KxKsYztBIwJnWE4CjRWelunfiEaVGTWiZ
         JCjQscIEGNfWwE3Y0JMeTXR3lDP7rY2JgcVdz9aycdGoFOfHO0CG9pSXY5sWUVmDtgp/
         xmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721210672; x=1721815472;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Dem9Aalm2RNMnEUQEEPY+XPaS5++v2y4aGes9SF7kc=;
        b=WFGAlSJ27fzTU4wsJkxcbKa+k2Rd/gB0BMPaJQXd51M3Ww1stLBeqEd1yUkrE3JbdM
         i8M5W6/ccciqaq5pePSRJzIxvZsewREMyRlDK+PRqZ7NiJKh3wTvxBrE5a1ehJGPwWzf
         QBDDa833bgKqrp4yqeS8SKw5EFzsdcyHRTppkyEp14IURxbgr9cpKXCPgWcnaC8mOKy7
         p5gY6xK0WwkfB6A9sI+Fy97A0ss34c2U3Jw6irRHDsJczOvikIlaoaXwyD/YjEX07NvD
         Wwrj65bmdiYzGhekgTPHFJqaUtDHM3lhR4deXoKm43TYcqVvXyzphDruEjSKJyJbZwgq
         sUPA==
X-Forwarded-Encrypted: i=1; AJvYcCWUrT/FzYiqmjl3/aDFyH0X72MlFq41zuthxQJogNtBl8Sn7LztvAsspdfh+skpYgCPRbWTJG7MWens9xmpOy2ckvZg8FmfSJX8
X-Gm-Message-State: AOJu0Yxz43ohVrec1N3eWgbrKNshgZY7a8CIItMc8hhSQt/Dbvex6dw9
	SyLaX27S3YzeSypD133/lVWHM33HAxOrbsofMmhfgRBUnXP1UH5E3b1Q6Pxfo3s=
X-Google-Smtp-Source: AGHT+IGJvkHc+XX7Mg6bdbOOQZEQz1KluPTQtmJJJwSsVS3Cm2m33FooYJdRHqbVqHQ9EhLdqILt1Q==
X-Received: by 2002:a05:6512:6c7:b0:52e:9d2c:1c56 with SMTP id 2adb3069b0e04-52ee53dc853mr858241e87.35.1721210671612;
        Wed, 17 Jul 2024 03:04:31 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed253924asm1425391e87.262.2024.07.17.03.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 03:04:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/7] clk: qcom: merge SM8550 and SM8650 display clock
 controller drivers
Date: Wed, 17 Jul 2024 13:04:27 +0300
Message-Id: <20240717-dispcc-sm8550-fixes-v2-0-5c4a3128c40b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACuXl2YC/22NwQ6CMBBEf4Xs2TWlFgqe/A/DAbsLbKKUtIZoS
 P/dSuLN45vJm9kgchCOcC42CLxKFD9n0IcC3NTPI6NQZtBKG2XLGkni4hzGR1NVCgd5ccTakK0
 ap4lOBrK5BN6LLF67zJPEpw/v/WQtv+lvz/7dW0tUyMPNUKstuba/3GXugz/6MEKXUvoA2KKvb
 7cAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=uv0ykO6lAHanu2zHRfaeWFxF3b1Xl5H0N7x9oqBBQPk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBml5ctwuPoxRAf3bo/nT+VjaowWb1dAgD0vsa+r
 i+ys9DKUWCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpeXLQAKCRCLPIo+Aiko
 1YTYCACeZB+7HeIRsCJ9+p0B3KoQ/E09owq4pLlimU74Z+s16CCa6j+Zt/a3VF/P6XdDphEXA3O
 NOZWI86j9Au1o+bFvu5xVJf1vp88AmsTaLjObcPp4UVB6DZd5L5FweWKr7nezGPMoIL9JpMymIw
 XVYYg3JnQicyOXFZwj4ntPKExj1+r5cR8DXlOWil83Aij4czpK4bS4Pq4amqoDfuXKptdFHNhBI
 lzls3+FFfNK6CSq1KHQGM0SYpn69f6dhYQg4/1ZvkB6SCcvFlO/JFAIoEFpqycF5tL9+9YeBkfu
 QjaKyRRZBgzJ/yg6lFRCD0wenNw1vkGSNbySrQdqMlQ3iro6
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SM8550 and SM8650 platforms have nearly the same dispcc block and
very similar drivers. Seeing fixes being applied to one of them, but not
another one, merge two drivers into a single codepiece.

Depends:
- https://lore.kernel.org/linux-arm-msm/20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org
  (patches 1/3 and 3/3 only)

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Moved the rogue chunk back to the patch 6/7
- Fixed the disp_cc_mdss_dptx1_usb_router_link_intf_clk parents (Neil)
- Link to v1: https://lore.kernel.org/r/20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org

---
Dmitry Baryshkov (7):
      clk: qcom: dispcc-sm8550: fix several supposed typos
      clk: qcom: dispcc-sm8550: use rcg2_ops for mdss_dptx1_aux_clk_src
      clk: qcom: dispcc-sm8550: make struct clk_init_data const
      clk: qcom: dispcc-sm8650: Update the GDSC flags
      clk: qcom: dispcc-sm8550: use rcg2_shared_ops for ESC RCGs
      clk: qcom: fold dispcc-sm8650 info dispcc-sm8550
      dt-bindings: clock: qcom,sm8650-dispcc: replace with symlink

 drivers/clk/qcom/Kconfig                       |   14 +-
 drivers/clk/qcom/Makefile                      |    1 -
 drivers/clk/qcom/dispcc-sm8550.c               |  198 +--
 drivers/clk/qcom/dispcc-sm8650.c               | 1796 ------------------------
 include/dt-bindings/clock/qcom,sm8650-dispcc.h |  103 +-
 5 files changed, 112 insertions(+), 2000 deletions(-)
---
base-commit: f6f1e4207e8eef4f8830b97ee0e2f9269bd88648
change-id: 20240716-dispcc-sm8550-fixes-64d758c2dd34

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


