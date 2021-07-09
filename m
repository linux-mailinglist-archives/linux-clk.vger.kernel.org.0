Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37DF73C1D16
	for <lists+linux-clk@lfdr.de>; Fri,  9 Jul 2021 03:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbhGIBdi (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 8 Jul 2021 21:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbhGIBdf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jul 2021 21:33:35 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58390C061762
        for <linux-clk@vger.kernel.org>; Thu,  8 Jul 2021 18:30:49 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id e20so5364531ljn.8
        for <linux-clk@vger.kernel.org>; Thu, 08 Jul 2021 18:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wyP7J/Id9E/NiKqq0jzeu92fkn8P4xmDSwnVicPRwts=;
        b=L0qpGINqAiLCW1vDeTta9d6iA3Qhk3vsc0qpOo3yqfMdLWREhYEwaHTQ6MVA7q1hYr
         +AWh2YiU680qW0hGh9a7jxN6EZdNgJ8i7DiXR7kH5fMlHLxW8qEUIzF9zkHnmk7rClVq
         1PlhS0v65woul6wWtwRrz+VfPIg0eu9DTn7QVUCqL6+dRngkTHLhz1T2sQgdGlVebFis
         F6QMElGQc6qhoGdpEFsQvh4lmbQAYoZxF72OZKia0HVnTLrGYOAidBVTm+0ROmUK7qwj
         Oybaoadvn99Ul0IhAfER5yEMiAr77dSb8iFZxUH1IfUDxV7PFnNf487c9ITYC3eY0DKH
         qMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wyP7J/Id9E/NiKqq0jzeu92fkn8P4xmDSwnVicPRwts=;
        b=mo/05F2Frt3FWssjfNH34cE7CQ6wUiX6c2vHYf2RTLIQwX10rkifTPmaDG8az3KoBU
         3pm6uwjzYgnnl7Op2qibNN87HdaMHRFxCGY04gKOcUHAMct+FLM7PA6Lm0uLFVVih9i2
         SigiN4gssrZp7aHD5B2n5jFZo3A9sxdOs9gzBYAJcok4omhzw8vPhkN8EemfSOdhjjvY
         EQ/rftL+ayDsKapdf4fnpMFgwCYXsQXyZh56uPGqup4gdR+owej/ucADQUKdzYMpwOxT
         6HVYuqLXZgsiFO42GfwcqOp/FA7y1EN37+3Qo/aJfm7zdDk2DumlZuW6VDDHuFu8Y1o0
         NBDw==
X-Gm-Message-State: AOAM531IsbwK0FlGTwd84kjGx9E4yn9ViPkavXDpvgXyjM1LsOgNyb+R
        IQVwab0Ex1CWTRZlhR8fYtzmYg==
X-Google-Smtp-Source: ABdhPJwSiOxtKirHq+83112xdbi6R/UqdH2ba0ZYAeKWBSHK7MNc8HrJzfkrZWgI4roFi/eL5MwEWw==
X-Received: by 2002:a2e:a546:: with SMTP id e6mr27080250ljn.155.1625794247525;
        Thu, 08 Jul 2021 18:30:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16sm405637ljj.113.2021.07.08.18.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 18:30:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] clk: qcom: use power-domain for sm8250's clock controllers
Date:   Fri,  9 Jul 2021 04:30:36 +0300
Message-Id: <20210709013043.495233-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On SM8250 both the display and video clock controllers are powered up by
the MMCX power domain. Handle this by linking clock controllers to the
proper power domain, and using runtime power management to enable and
disable the MMCX power domain.

Dependencies:
- https://lore.kernel.org/linux-pm/20210603093438.138705-1-ulf.hansson@linaro.org/ (merged in 5.14)
- https://lore.kernel.org/linux-arm-msm/20210703005416.2668319-1-bjorn.andersson@linaro.org/
  (pending)

Changes since v1:
 - Rebase on top of Bjorn's patches, removing the need for setting
   performance state directly.
 - Move runtime PM calls from GDSC code to generic genpd code.
 - Always call pm_runtime_enable in the Qualcomm generic clock
   controller code.
 - Register GDSC power domains as subdomains of the domain powering the
   clock controller if there is one.

----------------------------------------------------------------
Dmitry Baryshkov (7):
      dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx power domain
      dt-bindings: clock: qcom,videocc: add mmcx power domain
      PM: domains: Add support for runtime PM
      clk: qcom: gdsc: enable optional power domain support
      arm64: dts: qcom: sm8250: remove mmcx regulator
      clk: qcom: dispcc-sm8250: stop using mmcx regulator
      clk: qcom: videocc-sm8250: stop using mmcx regulator

 .../bindings/clock/qcom,dispcc-sm8x50.yaml         |  7 ++++
 .../devicetree/bindings/clock/qcom,videocc.yaml    |  7 ++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 11 ++-----
 drivers/base/power/domain.c                        | 33 +++++++++++++++++++
 drivers/clk/qcom/common.c                          | 37 ++++++++++++++++++----
 drivers/clk/qcom/dispcc-sm8250.c                   |  1 -
 drivers/clk/qcom/gdsc.c                            |  5 +++
 drivers/clk/qcom/videocc-sm8250.c                  |  4 ---
 include/linux/pm_domain.h                          |  6 ++++
 9 files changed, 91 insertions(+), 20 deletions(-)


