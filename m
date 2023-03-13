Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA1FC6B7C17
	for <lists+linux-clk@lfdr.de>; Mon, 13 Mar 2023 16:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjCMPjg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 13 Mar 2023 11:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjCMPjf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Mar 2023 11:39:35 -0400
X-Greylist: delayed 374 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 13 Mar 2023 08:39:33 PDT
Received: from out-51.mta1.migadu.com (out-51.mta1.migadu.com [IPv6:2001:41d0:203:375::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD15328225
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 08:39:33 -0700 (PDT)
Message-ID: <eb738303-b95c-408c-448d-0ebf983df01f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1678721597;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eu0UkR8sQte9C6pbwO79Nt2+mjEe13eli9HbMHrf494=;
        b=IHbgveoWRSXodRYSckjnvjKVZpI56kJGIClK/PuEb63HSzJ7bjn1oj/Ac56kWRMJZ54qgI
        nZVXIiR3/bJHnqd+9hS7BCPlLcAFvEDsfc52n+32TEVQN9tCKyhzhhU4RGVG9+pqO8Z2/Q
        nfy07Lx1aKYaP8Uz6/OCDxe85TJuNWE=
Date:   Mon, 13 Mar 2023 15:33:13 +0000
MIME-Version: 1.0
Subject: Re: [PATCH RFC v6 0/6] Create common DPLL/clock configuration API
Content-Language: en-US
To:     Jiri Pirko <jiri@resnulli.us>, Vadim Fedorenko <vadfed@meta.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20230312022807.278528-1-vadfed@meta.com>
 <ZA8VAzAhaXK3hg04@nanopsycho>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <ZA8VAzAhaXK3hg04@nanopsycho>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/03/2023 12:20, Jiri Pirko wrote:
> Sun, Mar 12, 2023 at 03:28:01AM CET, vadfed@meta.com wrote:
>> Implement common API for clock/DPLL configuration and status reporting.
>> The API utilises netlink interface as transport for commands and event
>> notifications. This API aim to extend current pin configuration and
>> make it flexible and easy to cover special configurations.
> 
> Could you please put here some command line examples to work with this?

We don't have open-source tools ready right now for specific hardware, 
but with YAML spec published you can use in-kernel tool to manipulate 
the values, i.e.:

./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml 
--dump device-get
./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml --do 
device-get --json '{"id": 0}'
./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml 
--dump pin-get
./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml --do 
pin-get --json '{"id": 0, "pin-idx":1}'
./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml --do 
pin-set --json '{"id":0, "pin-idx":1, "pin-frequency":1}'

> 
>>
>> v5 -> v6:
>> * rework pin part to better fit shared pins use cases
>> * add YAML spec to easy generate user-space apps
>> * simple implementation in ptp_ocp is back again
>> v4 -> v5:
>> * fix code issues found during last reviews:
>>    - replace cookie with clock id
>> 	 - follow one naming schema in dpll subsys
>> 	 - move function comments to dpll_core.c, fix exports
>> 	 - remove single-use helper functions
>> 	 - merge device register with alloc
>>    - lock and unlock mutex on dpll device release
>>    - move dpll_type to uapi header
>>    - rename DPLLA_DUMP_FILTER to DPLLA_FILTER
>>    - rename dpll_pin_state to dpll_pin_mode
>>    - rename DPLL_MODE_FORCED to DPLL_MODE_MANUAL
>>    - remove DPLL_CHANGE_PIN_TYPE enum value
>> * rewrite framework once again (Arkadiusz)
>>    - add clock class:
>>      Provide userspace with clock class value of DPLL with dpll device dump
>>      netlink request. Clock class is assigned by driver allocating a dpll
>>      device. Clock class values are defined as specified in:
>>      ITU-T G.8273.2/Y.1368.2 recommendation.
>>    - dpll device naming schema use new pattern:
>> 	   "dpll_%s_%d_%d", where:
>>        - %s - dev_name(parent) of parent device,
>>        - %d (1) - enum value of dpll type,
>>        - %d (2) - device index provided by parent device.
>>    - new muxed/shared pin registration:
>> 	   Let the kernel module to register a shared or muxed pin without finding
>>      it or its parent. Instead use a parent/shared pin description to find
>>      correct pin internally in dpll_core, simplifing a dpll API
>> * Implement complex DPLL design in ice driver (Arkadiusz)
>> * Remove ptp_ocp driver from the series for now
>> v3 -> v4:
>> * redesign framework to make pins dynamically allocated (Arkadiusz)
>> * implement shared pins (Arkadiusz)
>> v2 -> v3:
>> * implement source select mode (Arkadiusz)
>> * add documentation
>> * implementation improvements (Jakub)
>> v1 -> v2:
>> * implement returning supported input/output types
>> * ptp_ocp: follow suggestions from Jonathan
>> * add linux-clk mailing list
>> v0 -> v1:
>> * fix code style and errors
>> * add linux-arm mailing list
>>
>> Arkadiusz Kubalewski (3):
>>   dpll: spec: Add Netlink spec in YAML
>>   ice: add admin commands to access cgu configuration
>>   ice: implement dpll interface to control cgu
>>
>> Vadim Fedorenko (3):
>>   dpll: Add DPLL framework base functions
>>   dpll: documentation on DPLL subsystem interface
>>   ptp_ocp: implement DPLL ops
>>
>> Documentation/netlink/specs/dpll.yaml         |  514 +++++
>> Documentation/networking/dpll.rst             |  347 ++++
>> Documentation/networking/index.rst            |    1 +
>> MAINTAINERS                                   |    9 +
>> drivers/Kconfig                               |    2 +
>> drivers/Makefile                              |    1 +
>> drivers/dpll/Kconfig                          |    7 +
>> drivers/dpll/Makefile                         |   10 +
>> drivers/dpll/dpll_core.c                      |  835 ++++++++
>> drivers/dpll/dpll_core.h                      |   99 +
>> drivers/dpll/dpll_netlink.c                   | 1065 ++++++++++
>> drivers/dpll/dpll_netlink.h                   |   30 +
>> drivers/dpll/dpll_nl.c                        |  126 ++
>> drivers/dpll/dpll_nl.h                        |   42 +
>> drivers/net/ethernet/intel/Kconfig            |    1 +
>> drivers/net/ethernet/intel/ice/Makefile       |    3 +-
>> drivers/net/ethernet/intel/ice/ice.h          |    5 +
>> .../net/ethernet/intel/ice/ice_adminq_cmd.h   |  240 ++-
>> drivers/net/ethernet/intel/ice/ice_common.c   |  467 +++++
>> drivers/net/ethernet/intel/ice/ice_common.h   |   43 +
>> drivers/net/ethernet/intel/ice/ice_dpll.c     | 1845 +++++++++++++++++
>> drivers/net/ethernet/intel/ice/ice_dpll.h     |   96 +
>> drivers/net/ethernet/intel/ice/ice_lib.c      |   17 +-
>> drivers/net/ethernet/intel/ice/ice_main.c     |    7 +
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.c   |  411 ++++
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h   |  240 +++
>> drivers/net/ethernet/intel/ice/ice_type.h     |    1 +
>> drivers/ptp/Kconfig                           |    1 +
>> drivers/ptp/ptp_ocp.c                         |  206 +-
>> include/linux/dpll.h                          |  284 +++
>> include/uapi/linux/dpll.h                     |  196 ++
>> 31 files changed, 7135 insertions(+), 16 deletions(-)
>> create mode 100644 Documentation/netlink/specs/dpll.yaml
>> create mode 100644 Documentation/networking/dpll.rst
>> create mode 100644 drivers/dpll/Kconfig
>> create mode 100644 drivers/dpll/Makefile
>> create mode 100644 drivers/dpll/dpll_core.c
>> create mode 100644 drivers/dpll/dpll_core.h
>> create mode 100644 drivers/dpll/dpll_netlink.c
>> create mode 100644 drivers/dpll/dpll_netlink.h
>> create mode 100644 drivers/dpll/dpll_nl.c
>> create mode 100644 drivers/dpll/dpll_nl.h
>> create mode 100644 drivers/net/ethernet/intel/ice/ice_dpll.c
>> create mode 100644 drivers/net/ethernet/intel/ice/ice_dpll.h
>> create mode 100644 include/linux/dpll.h
>> create mode 100644 include/uapi/linux/dpll.h
>>
>> -- 
>> 2.34.1
>>

