Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE701552E9
	for <lists+linux-clk@lfdr.de>; Fri,  7 Feb 2020 08:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgBGHYl (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 7 Feb 2020 02:24:41 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:41033 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726642AbgBGHYl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Feb 2020 02:24:41 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581060280; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=yvIzAXlCUWtw8UVrvAHXcMI4NqUI2Q/iSLZWcJmbwuM=;
 b=IniC4+/3MAISHauTXlDUWa3Bu6BBoStzWefpCOha0xYi1J4rqiimuGGapT/xqq4nNndmS28F
 yljH/3QQ0WVtZHds7Zb46Es9OXbdOy30FTyu3jrkncDgAXKNyDmIZnA8HsSL0JHBSJoQ6BR1
 6A7wi318J6fiEKjsoHrBS1zYKcg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3d10ac.7f2e68c81340-smtp-out-n03;
 Fri, 07 Feb 2020 07:24:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 04C79C4479C; Fri,  7 Feb 2020 07:24:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 04154C433CB;
        Fri,  7 Feb 2020 07:24:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 07 Feb 2020 12:54:25 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?Q?Michael_Turquette_=C2=A0?= <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Add modem Clock controller (MSS CC) driver for
 SC7180
In-Reply-To: <1580357923-19783-1-git-send-email-tdas@codeaurora.org>
References: <1580357923-19783-1-git-send-email-tdas@codeaurora.org>
Message-ID: <ba110478a0dba14e12665d7060712f4c@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2020-01-30 09:48, Taniya Das wrote:
> [v3]
>   * Add clocks/clock-names required for the MSS clock controller.
>   * Add pm_ops to enable/disable the required dependent clock.
>   * Add parent_data for the MSS clocks.
>   * Update the GCC MSS clocks from _CBCR to _CLK.
> 
> [v2]
>   * Update the license for the documentation and fix minor comments in 
> the
>     YAML bindings.
> 
> [v1]
>   * Add driver support for Modem clock controller for SC7180 and also
>     update device tree bindings for the various clocks supported in the
>     clock controller.
> 
> Taniya Das (3):
>   dt-bindings: clock: Add YAML schemas for the QCOM MSS clock bindings
>   dt-bindings: clock: Introduce QCOM Modem clock bindings
>   clk: qcom: Add modem clock controller driver for SC7180

Tested-by: Sibi Sankar <sibis@codeaurora.org>

> 
>  .../devicetree/bindings/clock/qcom,mss.yaml        |  58 +++++++++
>  drivers/clk/qcom/Kconfig                           |   9 ++
>  drivers/clk/qcom/Makefile                          |   1 +
>  drivers/clk/qcom/gcc-sc7180.c                      |  70 ++++++++++
>  drivers/clk/qcom/mss-sc7180.c                      | 143 
> +++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sc7180.h        |   5 +
>  include/dt-bindings/clock/qcom,mss-sc7180.h        |  12 ++
>  7 files changed, 298 insertions(+)
>  create mode 100644 
> Documentation/devicetree/bindings/clock/qcom,mss.yaml
>  create mode 100644 drivers/clk/qcom/mss-sc7180.c
>  create mode 100644 include/dt-bindings/clock/qcom,mss-sc7180.h
> 
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a 
> member
> of the Code Aurora Forum, hosted by the  Linux Foundation.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
