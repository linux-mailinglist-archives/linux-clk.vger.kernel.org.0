Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCFF821D674
	for <lists+linux-clk@lfdr.de>; Mon, 13 Jul 2020 15:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729764AbgGMNAr (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 13 Jul 2020 09:00:47 -0400
Received: from foss.arm.com ([217.140.110.172]:33090 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726586AbgGMNAq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 13 Jul 2020 09:00:46 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F4EC31B;
        Mon, 13 Jul 2020 06:00:46 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5526D3F887;
        Mon, 13 Jul 2020 06:00:45 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sudeep Holla <sudeep.holla@arm.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Dien Pham <dien.pham.ry@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] firmware: arm_scmi: Keep the discrete clock rates sorted
Date:   Mon, 13 Jul 2020 14:00:43 +0100
Message-Id: <159464497506.50199.14329174920996979052.b4-ty@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709081705.46084-1-sudeep.holla@arm.com>
References: <20200709081705.46084-1-sudeep.holla@arm.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 9 Jul 2020 09:17:04 +0100, Sudeep Holla wrote:
> Instead of relying on the firmware to keep the clock rates sorted, let
> us sort the list. This is not essential for clock layer but it helps
> to find the min and max rates easily from the list.

Applied to sudeep.holla/linux (for-next/scmi), thanks!

[1/2] firmware: arm_scmi: Keep the discrete clock rates sorted
      https://git.kernel.org/sudeep.holla/c/dccec73de9
[2/2] clk: scmi: Fix min and max rate when registering clocks with discrete rates
      https://git.kernel.org/sudeep.holla/c/fcd2e0deae

--
Regards,
Sudeep

