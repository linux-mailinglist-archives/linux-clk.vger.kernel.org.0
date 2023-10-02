Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D09B7B58FA
	for <lists+linux-clk@lfdr.de>; Mon,  2 Oct 2023 19:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238671AbjJBRL3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 2 Oct 2023 13:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238643AbjJBRL2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Oct 2023 13:11:28 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C3F82AD;
        Mon,  2 Oct 2023 10:11:24 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 026D6C15;
        Mon,  2 Oct 2023 10:12:03 -0700 (PDT)
Received: from pluto (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23EAF3F59C;
        Mon,  2 Oct 2023 10:11:23 -0700 (PDT)
Date:   Mon, 2 Oct 2023 18:11:21 +0100
From:   Cristian Marussi <cristian.marussi@arm.com>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 0/2] firmware: arm_scmi: clock: support parents
 commands
Message-ID: <ZRr5udlXF0L3BgPA@pluto>
References: <20231001-scmi-clock-v2-v3-0-898bd92d8939@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231001-scmi-clock-v2-v3-0-898bd92d8939@nxp.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Oct 01, 2023 at 12:38:42PM +0800, Peng Fan (OSS) wrote:
> V2:
>  Add determine_rate hooks
> 
> SCMI v3.2 spec adds parents commands, this patchset is to support them:
> CLOCK_POSSIBLE_PARENTS_GET
> CLOCK_PARENT_SET
> CLOCK_PARENT_GET
> 

Hi Peng,

thanks for your update.

The SCMI part looks good to me but I'll made a few notes on clk-scmi
driver

Thanks,
Cristian
