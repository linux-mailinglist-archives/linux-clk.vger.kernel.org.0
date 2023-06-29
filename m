Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 600C1742037
	for <lists+linux-clk@lfdr.de>; Thu, 29 Jun 2023 08:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbjF2GOd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 29 Jun 2023 02:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbjF2GOb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Jun 2023 02:14:31 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF2F268F
        for <linux-clk@vger.kernel.org>; Wed, 28 Jun 2023 23:14:29 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31114b46d62so342825f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Jun 2023 23:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1688019267; x=1690611267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BxPmChzKXR1dj/ko+9tzcHvICaNxDCij9PscVU1CwGY=;
        b=g4spu/YTypGbdobXCPpsNMEE7fZgSTh6dwO8ck/RlyJzKG32ec8qbcH4voInoYNI6o
         nG6/zJ1n82WItH1lu3qQCRFI8uw3L8ph8dhnODO74Jobt9mAAC6aVPmcAOEeHa3CijaY
         GQ0EQQTgLWtAzMyQV8sZkz9pP1Q5sB+jGzX0IRtVzmIH7vRZDqd7kAqk/QYf3QTa8aEJ
         QSuo/h0rl0fcrDEeomgjT4HhlbHIS1Bzm651nwZXtQyAM08WdVMOLO0uppwo8McOoT1j
         8CGh366oXSh0q2wYy6HTFoOLtXKgeVtSm3qpnqhqbheagjwO+/UJVS4tnevaSr7XLabv
         Rrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688019267; x=1690611267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxPmChzKXR1dj/ko+9tzcHvICaNxDCij9PscVU1CwGY=;
        b=P05FwPP/gJ4JIPmvvuRD1d1OTfQ1g6VWrc5/IM/LX7e5uovfcvwmLtXevrL3u8SVgU
         Oi9XBNubFoIGW3/+mZ2vjBqZJB669YeD9ZfLBNsMW+PAV8XZezebjcDkOlx6BN7VWwIo
         +/XbWJqYWwyQlZmhsHKT5XxJEfkOeInPfFFu5DigyVrZPaiaRqrCRgyvvG17r8pqyyfT
         HMt6KeDuDyjktMUmfNGeY2m0iaBfib9qIuYElC2reAgxGVv9plQPPl0KGwfp+aBKev2I
         zf76bPqWzYtw7t2NFzFdWSKJ40zp7oOqHPAoE2OG0IGbYeNC0G8HC6COgVa6PYVxGffg
         LL3w==
X-Gm-Message-State: AC+VfDyGU80ZtjOszI2nvsrhNqcnCneQpdhleD/dRk16lqiN6IMZ/HoO
        k+QH6X8+QDvxU7sr0Mf+UEWy0Q==
X-Google-Smtp-Source: ACHHUZ7KKCQek3b9yJkpoCmAdgzst9lXvnl9IF1wrn2teksRP3fkGVdr25X0T5kABFTNqxM9KgVooQ==
X-Received: by 2002:a05:6000:181:b0:30f:d218:584a with SMTP id p1-20020a056000018100b0030fd218584amr32939868wrx.23.1688019267545;
        Wed, 28 Jun 2023 23:14:27 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id b7-20020a5d45c7000000b003141a3c4353sm460558wrs.30.2023.06.28.23.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 23:14:26 -0700 (PDT)
Date:   Thu, 29 Jun 2023 08:14:25 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     "kuba@kernel.org" <kuba@kernel.org>,
        "vadfed@meta.com" <vadfed@meta.com>,
        "jonathan.lemon@gmail.com" <jonathan.lemon@gmail.com>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "vadfed@fb.com" <vadfed@fb.com>,
        "Brandeburg, Jesse" <jesse.brandeburg@intel.com>,
        "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
        "M, Saeed" <saeedm@nvidia.com>,
        "leon@kernel.org" <leon@kernel.org>,
        "richardcochran@gmail.com" <richardcochran@gmail.com>,
        "sj@kernel.org" <sj@kernel.org>,
        "javierm@redhat.com" <javierm@redhat.com>,
        "ricardo.canuelo@collabora.com" <ricardo.canuelo@collabora.com>,
        "mst@redhat.com" <mst@redhat.com>,
        "tzimmermann@suse.de" <tzimmermann@suse.de>,
        "Michalik, Michal" <michal.michalik@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "jacek.lawrynowicz@linux.intel.com" 
        <jacek.lawrynowicz@linux.intel.com>,
        "airlied@redhat.com" <airlied@redhat.com>,
        "ogabbay@kernel.org" <ogabbay@kernel.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "nipun.gupta@amd.com" <nipun.gupta@amd.com>,
        "axboe@kernel.dk" <axboe@kernel.dk>,
        "linux@zary.sk" <linux@zary.sk>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "Olech, Milena" <milena.olech@intel.com>,
        "kuniyu@amazon.com" <kuniyu@amazon.com>,
        "liuhangbin@gmail.com" <liuhangbin@gmail.com>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "andy.ren@getcruise.com" <andy.ren@getcruise.com>,
        "razor@blackwall.org" <razor@blackwall.org>,
        "idosch@nvidia.com" <idosch@nvidia.com>,
        "lucien.xin@gmail.com" <lucien.xin@gmail.com>,
        "nicolas.dichtel@6wind.com" <nicolas.dichtel@6wind.com>,
        "phil@nwl.cc" <phil@nwl.cc>,
        "claudiajkang@gmail.com" <claudiajkang@gmail.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
        "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>
Subject: Re: [RFC PATCH v8 08/10] ice: implement dpll interface to control cgu
Message-ID: <ZJ0hQRcm6S05r8VE@nanopsycho>
References: <20230609121853.3607724-1-arkadiusz.kubalewski@intel.com>
 <20230609121853.3607724-9-arkadiusz.kubalewski@intel.com>
 <ZISmmH0jqxZRB4VX@nanopsycho>
 <DM6PR11MB4657161D2871747A7B404EDD9B5FA@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZJLtR0c+tvCbUgri@nanopsycho>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJLtR0c+tvCbUgri@nanopsycho>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Wed, Jun 21, 2023 at 02:29:59PM CEST, jiri@resnulli.us wrote:
>Mon, Jun 19, 2023 at 10:34:12PM CEST, arkadiusz.kubalewski@intel.com wrote:
>>>From: Jiri Pirko <jiri@resnulli.us>
>>>Sent: Saturday, June 10, 2023 6:37 PM
>>>
>>>Fri, Jun 09, 2023 at 02:18:51PM CEST, arkadiusz.kubalewski@intel.com wrote:
>>>
>>>[...]
>>>
>>>
>>>>+static int ice_dpll_mode_get(const struct dpll_device *dpll, void *priv,
>>>>+			     enum dpll_mode *mode,
>>>>+			     struct netlink_ext_ack *extack)
>>>>+{
>>>>+	*mode = DPLL_MODE_AUTOMATIC;
>>>
>>>I don't understand how the automatic mode could work with SyncE. The
>>>There is one pin exposed for one netdev. The SyncE daemon should select
>>>exacly one pin. How do you achieve that?
>>>Is is by setting DPLL_PIN_STATE_SELECTABLE on the pin-netdev you want to
>>>select and DPLL_PIN_STATE_DISCONNECTED on the rest?
>>>
>>>
>>>[...]
>>
>>AUTOMATIC mode autoselects highest priority valid signal.
>>As you have pointed out, for SyncE selection, the user must be able to manually
>>select a pin state to enable recovery of signal from particular port.
>>
>>In "ice" case there are 2 pins for network PHY clock signal recovery, and both
>>are parent pins (MUX-type). There are also 4 pins assigned to netdevs (one per
>>port). Thus passing a signal from PHY to the pin is done through the MUX-pin,
>>by selecting proper state on pin-parent pair (where parent pins is highest prio
>>pin on dpll).
>
>Could you show me some examples please?

Arkadiusz, could you please reply to this?
Thanks!

>
>
>>
>>Thank you!
>>Arkadiusz
