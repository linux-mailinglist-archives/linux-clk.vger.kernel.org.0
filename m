Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1017CECFA
	for <lists+linux-clk@lfdr.de>; Thu, 19 Oct 2023 02:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjJSAyP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 18 Oct 2023 20:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjJSAyP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Oct 2023 20:54:15 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AFFD118
        for <linux-clk@vger.kernel.org>; Wed, 18 Oct 2023 17:54:13 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DDCC433C7;
        Thu, 19 Oct 2023 00:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697676853;
        bh=qldABZEm4iEuzefbS6tw1hvTzUYfXMHWYUdoVSGer+8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HAeRm/HborebXWpwiR5q1JlVQQRCkodgIcvj2p/xfuhRDlqDD4LLUs63PAzMcJpnr
         lZTfqEPi8S5fIb94wPxtvNDA7T+YQeMGfoK2xjc3iK2I0HzHEwGCxBgV4t8OdE7gU/
         n+Jw6mV8NZwXVCZRQd5RxP+hap7sL5HrpQ2T/eQQoAE6ntxrO2HOpl3mwnaMbvzkB/
         uNAmD7skTFZ1XLD4wfhu5XsofYBpv0h7QnfwOs0XNV/5UC/GB0ua1C+GtLJ/03jnOW
         yLzGXZ/l0koaM45COY0zWE11oJ3WPgeAGgqF/mNYBpbq5pg5Ssr5k6jNqeAmaypQhT
         D5aTJcveP3flQ==
Message-ID: <624ad8f4e966bb62e6d7571da868c3d3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231004193600.66232-1-sudeep.holla@arm.com>
References: <20231004193600.66232-1-sudeep.holla@arm.com>
Subject: Re: [PATCH] clk: scmi: Free scmi_clk allocated when the clocks with invalid info are skipped
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
To:     Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org
Date:   Wed, 18 Oct 2023 17:54:09 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sudeep Holla (2023-10-04 12:36:00)
> Add the missing devm_kfree() when we skip the clocks with invalid or
> missing information from the firmware.
>=20
> Cc: Cristian Marussi <cristian.marussi@arm.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Fixes: 6d6a1d82eaef ("clk: add support for clocks provided by SCMI")
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
